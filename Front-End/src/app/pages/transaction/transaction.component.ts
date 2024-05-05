import { Component, OnInit } from '@angular/core';
import { UserTransaction } from '../../models/UserTransaction';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { StorageService } from '../../service/storage/storage.service';
import { env } from '../../environments/env';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-transaction',
  standalone: true,
  imports: [ CommonModule ],
  templateUrl: './transaction.component.html',
  styleUrl: './transaction.component.scss'
})
export class TransactionComponent  implements OnInit{
  userTansactions: UserTransaction[] = []
  headers: HttpHeaders = new HttpHeaders({});
  current_page: number = 1;
  page_number: number = 1;

  constructor(private http: HttpClient, private storageService: StorageService) {}

  ngOnInit(): void {
    this.updateHeaders();
    this.updateUserTransaction();
  }
  updateHeaders(): void {
    const accessToken = this.storageService.getItem("access_token");
    if (accessToken)  this.headers = new HttpHeaders({ 'ApiToken': accessToken });
  }
  updateUserTransaction(): void {
    this.http.get<any>(env.baseUrl + "/transactions", { headers: this.headers})
    .subscribe(data => {
      console.log(data);
      this.userTansactions = data.data;
      this.current_page = data.current_page
      this.page_number = data.last_page
      console.log(this.userTansactions)
    })
  }
  getLabelForIdEtat(idEtat: number): string {
    switch (idEtat) {
      case 0:
        return 'Livré';
      case 1:
        return 'Bien reçu';
      case 2:
        return 'Effectué';
      default:
        return 'Invalid';
    }
  }


}
