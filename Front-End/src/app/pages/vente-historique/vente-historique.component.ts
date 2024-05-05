import { Component } from '@angular/core';
import { HistoriqueComponent } from './historique/historique.component';
import { RouterModule } from '@angular/router';

@Component({
  selector: 'app-vente-historique',
  standalone: true,
  imports: [HistoriqueComponent, RouterModule],
  templateUrl: './vente-historique.component.html',
  styleUrl: './vente-historique.component.scss'
})
export class VenteHistoriqueComponent {

}
