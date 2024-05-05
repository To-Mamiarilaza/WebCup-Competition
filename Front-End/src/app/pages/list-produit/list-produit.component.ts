import { Component } from "@angular/core";
import { ProduitComponent } from "../home/produit/produit.component";
import { ListProduitService } from "../../service/list-produit/list-produit.service";
import { CommonModule } from "@angular/common";
import { Category } from "../../model/Category";
import { Product } from "../../model/Product";

@Component({
  selector: "app-list-produit",
  standalone: true,
  imports: [ProduitComponent, CommonModule],
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
  constructor(private listProduitService: ListProduitService) {}

  ngOnInit() {
    this.data = this.listProduitService.getAll();
    this.categories = this.data.categories;
    this.produits = this.data.produits.data;
    this.conditionProduits = this.data.conditionProduits;
    this.pays = this.data.pays;
    this.villes = this.data.villes;
    console.log(this.produits);
  }

  getNextPage() {
    this.data = this.listProduitService.page(this.data.next_page_url);
    this.current_page += 1;
  }

  getPreviousPage() {
    this.data = this.listProduitService.page(this.data.prev_page_url);
    this.current_page -= 1;
  }
}
