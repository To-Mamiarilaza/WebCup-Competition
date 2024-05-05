import { Component } from '@angular/core';
import { HistoriqueComponent } from './historique/historique.component';

@Component({
  selector: 'app-vente-historique',
  standalone: true,
  imports: [HistoriqueComponent],
  templateUrl: './vente-historique.component.html',
  styleUrl: './vente-historique.component.scss'
})
export class VenteHistoriqueComponent {

}
