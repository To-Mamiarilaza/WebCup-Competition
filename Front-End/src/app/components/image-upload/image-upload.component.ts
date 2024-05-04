// image-upload.component.ts
import { Component, ElementRef, ViewChild } from '@angular/core';
import { Firestore } from '@angular/fire/firestore';
import { getStorage, ref, uploadBytesResumable, getDownloadURL } from 'firebase/storage';
import { NgxImageCompressService } from 'ngx-image-compress';
@Component({
  selector: 'app-image-upload',
  templateUrl: './image-upload.component.html',
  styleUrls: ['./image-upload.component.scss'],
})
export class ImageUploadComponent {
  @ViewChild('fileInput') fileInput!: ElementRef;
  image: File | null = null;
  uploadProgress = 0;

  constructor(
    private firestore: Firestore, 
    private imageCompress: NgxImageCompressService,
    ) {}

  async onChange(event: Event) {
    const inputElement = event.target as HTMLInputElement;
    if (inputElement.files && inputElement.files.length > 0) {
      this.image = await this.compressFile(inputElement.files[0]);
    }
  }
  onSubmit(event: Event) {
    event.preventDefault();
    this.uploadImage();
  }

  async onFileSelected(event: Event) {
    const inputElement = event.target as HTMLInputElement;
    if (inputElement.files && inputElement.files.length > 0) {
      this.image = await this.compressFile(inputElement.files[0]);
      this.uploadImage();
    }
  }

  async uploadImage() {
    if (!this.image) return;
    const storage = getStorage();
    const storageRef = ref(storage, `images/${Date.now()}_${this.image.name}`);
    const uploadTask = uploadBytesResumable(storageRef, this.image);

    uploadTask.on('state_changed', (snapshot) => {
      this.uploadProgress = (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
    }, (error) => {
      console.error(error);
    }, async () => {
      const downloadURL = await getDownloadURL(uploadTask.snapshot.ref);
      console.log('File available at', downloadURL);
    });
  }


  // ------------------------------------------- RESIZE IMAGE
  async compressFile(image: File): Promise<File> {
    const base64: string = await this.convertToBase64(image);
    return new Promise<File>((resolve, reject) => {
      this.imageCompress.compressFile(base64, -1, 50, 50).then(
        (result: string) => {
          const blob = this.dataURItoBlob(result);
          const compressedImage = new File([blob], image.name, { type: blob.type });
          resolve(compressedImage);
        },
        (error: any) => {
          console.error('Failed to compress image', error);
          reject(error);
        }
      );
    });
  }
  
  async convertToBase64(file: File): Promise<string> {
    return new Promise<string>((resolve, reject) => {
      const reader = new FileReader();
      reader.onload = () => resolve(reader.result as string);
      reader.onerror = error => reject(error);
      reader.readAsDataURL(file);
    });
  }

  dataURItoBlob(dataURI: string): Blob {
    const byteString = atob(dataURI.split(',')[1]);
    const mimeString = dataURI.split(',')[0].split(':')[1].split(';')[0];
    const arrayBuffer = new ArrayBuffer(byteString.length);
    const int8Array = new Uint8Array(arrayBuffer);
    for (let i = 0; i < byteString.length; i++) {
      int8Array[i] = byteString.charCodeAt(i);
    }
    return new Blob([arrayBuffer], { type: mimeString });
  }
}
