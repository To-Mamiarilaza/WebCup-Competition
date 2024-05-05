import { Inject, Injectable } from "@angular/core";
import { DOCUMENT } from "@angular/common";
import { StorageService } from "../storage/storage.service";

@Injectable({
  providedIn: "root",
})
export class AuthService {
  constructor(private storageService: StorageService) {}

  isAuthenticated() {
    console.log(this.storageService.getItem("access_token"));
    return this.storageService.getItem("access_token") ? true : false;
  }

  setToken(token: string) {
    this.storageService.setItem("access_token", token);
  }
}
