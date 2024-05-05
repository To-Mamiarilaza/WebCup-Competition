import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { EquivalenceDevise } from '../../models/EquivalenceDevise';
import { CommonModule } from '@angular/common'; // Import du CommonModule
import { env } from '../../environments/env';

@Component({
  selector: 'app-token-purchase',
  standalone: true,
  imports: [CommonModule],
  templateUrl: './token-purchase.component.html',
  styleUrl: './token-purchase.component.scss'
})
export class TokenPurchaseComponent  implements OnInit{
  equivalenceDevises: EquivalenceDevise[] = []
  deviseSelected: EquivalenceDevise | null = null;

  constructor(private http: HttpClient) {}

  ngOnInit(): void {
    this.http.get<EquivalenceDevise[]>(env.baseUrl + "/equivalence_devises")
    .subscribe(data => {
      this.equivalenceDevises = data
    })
  }
  onDeviseSelect(devise: EquivalenceDevise): void {
    this.deviseSelected = devise;
  }

  
}
