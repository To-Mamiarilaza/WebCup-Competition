import { Component } from '@angular/core';
import { ProduitComponent } from '../home/produit/produit.component';

@Component({
  selector: 'app-list-produit',
  standalone: true,
  imports: [ProduitComponent],
  templateUrl: './list-produit.component.html',
  styleUrl: './list-produit.component.scss'
})
export class ListProduitComponent {

}
