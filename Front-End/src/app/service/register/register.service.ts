import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { BehaviorSubject, catchError, tap, throwError } from "rxjs";
import { AuthService } from "../auth/auth.service";
import { File } from "buffer";
import { env } from "../../environments/env";
import { Router } from "@angular/router";

@Injectable({
  providedIn: "root",
})
export class RegisterService {
  private loadingSubject = new BehaviorSubject<boolean>(false);
  public loading$ = this.loadingSubject.asObservable();
  private errorSubject = new BehaviorSubject<string | null>(null);
  public error$ = this.errorSubject.asObservable();

  constructor(
    public http: HttpClient,
    public authService: AuthService,
    private route: Router
  ) {}

  signUp(newUser: {
    email: string;
    password: string;
    telephone: string;
    avatar: string;
    name: string;
    profile: number;
  }) {
    this.loadingSubject.next(true);
    this.http
      .post(`${env.baseUrl}/api/register`, newUser)
      .pipe(
        tap(() => this.loadingSubject.next(false)),
        catchError((err) => {
          this.loadingSubject.next(false);
          this.errorSubject.next(err.error.message);
          return throwError(() => {
            return err;
          });
        })
      )
      .subscribe((response: any) => {
        this.route.navigate(["/page/sign-in"]);
      });
  }
}
