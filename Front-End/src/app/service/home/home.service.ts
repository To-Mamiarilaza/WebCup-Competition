import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { BehaviorSubject, catchError, tap, throwError } from "rxjs";
import { env } from "../../environments/env";
import { Product } from "../../model/Product";
import { Category } from "../../model/Category";

@Injectable({
  providedIn: "root",
})
export class HomeService {
  private loadingSubject = new BehaviorSubject<boolean>(false);
  public loading$ = this.loadingSubject.asObservable();
  private errorSubject = new BehaviorSubject<string | null>(null);
  public error$ = this.errorSubject.asObservable();

  constructor(public http: HttpClient) {}

  getData() {
    this.loadingSubject.next(true);
    let data: { products: Product[]; categories: Category[] } = {
      products: [],
      categories: [],
    };
    this.http
      .get(`${env.baseUrl}/api/acceuil`)
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
        data = response;
      });
    return data;
  }
}
