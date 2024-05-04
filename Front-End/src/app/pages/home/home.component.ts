import { Component, inject } from '@angular/core';
import { CommonModule } from '@angular/common';
import { CategorieComponent } from './categorie/categorie.component';
import { ProduitComponent } from './produit/produit.component';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [CommonModule, CategorieComponent, ProduitComponent],
  templateUrl: './home.component.html',
  styleUrl: './home.component.scss',
})
export class HomeComponent {
  
}
