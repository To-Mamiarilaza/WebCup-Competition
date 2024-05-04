import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { BehaviorSubject, throwError, tap, catchError } from "rxjs";
import { env } from "../../environments/env";
import { AuthService } from "../auth/auth.service";
import { Router } from "@angular/router";

@Injectable({
  providedIn: "root",
})
export class LoginService {
  private loadingSubject = new BehaviorSubject<boolean>(false);
  public loading$ = this.loadingSubject.asObservable();
  private errorSubject = new BehaviorSubject<string | null>(null);
  public error$ = this.errorSubject.asObservable();

  constructor(
    public http: HttpClient,
    public authService: AuthService,
    public route: Router
  ) {}

  signin(credentials: { email: string; password: string }) {
    this.loadingSubject.next(true);
    this.http
      .post(`${env.baseUrl}/api/login`, credentials)
      .pipe(
        tap(() => this.loadingSubject.next(false)),
        catchError((err) => {
          this.loadingSubject.next(false);
          this.errorSubject.next(err.error.message);
          return throwError(() => err);
        })
      )
      .subscribe((response: any) => {
        this.authService.setToken(response.token.original.token);
        this.route.navigate(["/main"]);
      });
  }
}
