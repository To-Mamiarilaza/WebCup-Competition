import { Injectable } from "@angular/core";
import { CookieService } from "ngx-cookie-service";

@Injectable({
  providedIn: "root",
})
export class StorageService {
  constructor(private cookieService: CookieService) {}

  setItem(key: string, value: string, path: string = '/'): void {
    this.cookieService.set(key, value, undefined, path);
  }

  getItem(key: string): string | null {
    return this.cookieService.get(key);
  }

  removeItem(key: string): void {
    this.cookieService.delete(key);
  }

  clear(): void {
    this.cookieService.deleteAll();
  }
}
