import { Component } from "@angular/core";
import { ProduitComponent } from "../home/produit/produit.component";
import { ListProduitService } from "../../service/list-produit/list-produit.service";
import { CommonModule } from "@angular/common";
import { Category } from "../../model/Category";
import { Product } from "../../model/Product";
import { FormsModule } from "@angular/forms";

@Component({
  selector: "app-list-produit",
  standalone: true,
  imports: [ProduitComponent, CommonModule, FormsModule],
  templateUrl: "./list-produit.component.html",
  styleUrl: "./list-produit.component.scss",
})
export class ListProduitComponent {
  categories: Category[] = [];
  produits: Product[] = [];
  conditionProduits: any[] = [];
  pays: any[] = [];
  villes: any[] = [];
  current_page = 1;
  data: any;

  min_price = 0;
  max_price = 0;
  categories_id: number[] = [];
  conditions_id: number[] = [];
  ville_id = null;
  pays_id = null;

  constructor(private listProduitService: ListProduitService) {}

  ngOnInit() {
    this.listProduitService.getAll().subscribe((response) => {
      this.data = response;
      this.categories = this.data.categories;
      for (let i = 0; i < this.categories.length; i++) {
        this.categories_id.push(-1);
      }
      this.produits = this.data.produits.data;
      this.conditionProduits = this.data.conditionProduits;
      for (let i = 0; i < this.conditionProduits.length; i++) {
        this.conditions_id.push(-1);
      }
      this.pays = this.data.pays;
      this.villes = this.data.villes;
    });
    console.log(this.data);
  }

  getNextPage() {
    this.data = this.listProduitService.page(this.data.next_page_url);
    this.current_page += 1;
  }

  getPreviousPage() {
    this.data = this.listProduitService.page(this.data.prev_page_url);
    this.current_page -= 1;
  }

  filter() {
    this.data = this.listProduitService.filter({
      min_price: this.min_price,
      max_price: this.max_price,
      categorie: this.categories_id,
      condition: this.conditions_id,
      ville: this.ville_id,
      pays: this.pays_id,
      page: 1,
    });
  }
}
