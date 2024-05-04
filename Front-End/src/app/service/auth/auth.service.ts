import { Inject, Injectable } from "@angular/core";
import { DOCUMENT } from "@angular/common";

@Injectable({
  providedIn: "root",
})
export class AuthService {
  authenticated = false;
  localStorage: Storage | undefined;

  constructor(@Inject(DOCUMENT) private document: Document) {
    this.localStorage = document.defaultView?.localStorage;
  }

  isAuthenticated() {
    return this.localStorage?.getItem("access_token") ? true : false;
  }

  setToken(token: string) {
    this.localStorage?.setItem("acess_token", token);
  }
}
