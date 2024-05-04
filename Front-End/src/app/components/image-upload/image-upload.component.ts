// image-upload.component.ts
import { Component, ElementRef, ViewChild } from '@angular/core';
import { Firestore } from '@angular/fire/firestore';
import { getStorage, ref, uploadBytesResumable, getDownloadURL } from 'firebase/storage';

@Component({
  selector: 'app-image-upload',
  templateUrl: './image-upload.component.html',
  styleUrls: ['./image-upload.component.scss'],
})
export class ImageUploadComponent {
  @ViewChild('fileInput') fileInput!: ElementRef;
  image: File | null = null;
  uploadProgress = 0;

  constructor(private firestore: Firestore) {}

  onChange(event: Event) {
    const inputElement = event.target as HTMLInputElement;
    if (inputElement.files && inputElement.files.length > 0) {
      this.image = inputElement.files[0];
    }
  }
  onSubmit(event: Event) {
    event.preventDefault();
    this.uploadImage();
  }

  onFileSelected(event: Event) {
    const inputElement = event.target as HTMLInputElement;
    if (inputElement.files && inputElement.files.length > 0) {
      this.image = inputElement.files[0];
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
}
