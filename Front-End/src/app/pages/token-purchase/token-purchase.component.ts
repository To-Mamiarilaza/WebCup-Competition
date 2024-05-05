import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Component, OnInit, inject } from '@angular/core';
import { EquivalenceDevise } from '../../models/EquivalenceDevise';
import { CommonModule } from '@angular/common'; // Import du CommonModule
import { env } from '../../environments/env';
import { StorageService } from '../../service/storage/storage.service';

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
  headers: HttpHeaders;
  nb_jeton: number = 0;
  user_jeton: number | null = null;

  constructor(private http: HttpClient, private storageService: StorageService) {
    this.headers = new HttpHeaders({});
  }
  
  ngOnInit(): void {
    this.updateHeaders();
    // this.http.get<EquivalenceDevise[]>("http://127.0.0.1:8000/api/equivalence_devises", { headers: this.headers})
    this.http.get<EquivalenceDevise[]>(env.baseUrl + "/equivalence_devises", { headers: this.headers})
    .subscribe(data => {
      this.equivalenceDevises = data
    })
    this.updateUserJeton();
  }
  updateHeaders(): void {
    const accessToken = this.storageService.getItem("access_token");
    if (accessToken)  this.headers = new HttpHeaders({ 'ApiToken': accessToken });
  }
  updateUserJeton(): void {
    // this.http.get<any>("http://127.0.0.1:8000/api/jeton-utilisateur", { headers: this.headers})
    this.http.get<any>(env.baseUrl + "/jeton-utilisateur", { headers: this.headers})
    .subscribe(data => {
      this.user_jeton = data['reste'];
    })
  }
  onDeviseSelect(devise: EquivalenceDevise): void {
    this.deviseSelected = devise;
  }
  handleNbJeton(event: Event){
    this.nb_jeton = parseInt((event.target as HTMLInputElement)?.value ?? '0', 10);  
  }

  newJeton(): void{
    const body = {
      "valeur_devise": this.deviseSelected?.valeur,
      "montant": this.nb_jeton
     };
    //  this.http.post<any>("http://127.0.0.1:8000/api/vente-jetons", body, { headers: this.headers })
    this.http.post<any>(env.baseUrl + "/vente-jetons", body, { headers: this.headers })
    .subscribe({
      next: (data) => {
        // Gérer la réponse réussie ici
        console.log("Réponse réussie :", data);
        this.updateUserJeton();
      },
      error: (error) => {
        // Gérer l'erreur ici
        console.error("Erreur lors de la requête :", error);
      }
    });
  }

  
}
