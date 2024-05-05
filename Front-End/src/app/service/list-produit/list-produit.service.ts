import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { env } from "../../environments/env";
import { BehaviorSubject, catchError, Observable, tap, throwError } from "rxjs";

@Injectable({
  providedIn: "root",
})
export class ListProduitService {
  private loadingSubject = new BehaviorSubject<boolean>(false);
  public loading$ = this.loadingSubject.asObservable();
  private errorSubject = new BehaviorSubject<string | null>(null);
  public error$ = this.errorSubject.asObservable();

  constructor(public http: HttpClient) {}

  getAll(): Observable<any> {
    this.loadingSubject.next(true);
    return this.http.post(`${env.baseUrl}/api/list-produit-init`, {}).pipe(
      tap(() => this.loadingSubject.next(false)),
      catchError((err) => {
        this.loadingSubject.next(false);
        this.errorSubject.next(err.error.message);
        return throwError(() => {
          return err;
        });
      })
    );
  }

  page(url: string) {
    let resp: any[] = [];
    this.loadingSubject.next(true);
    this.http
      .post(url, {})
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
        resp = response;
      });
    return resp;
  }

  filter(body: any) {
    let resp: any;
    this.loadingSubject.next(true);
    this.http
      .post(`${env.baseUrl}/api/list-produit-filtre`, body)
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
        resp = response;
      });
    return resp;
  }
}
