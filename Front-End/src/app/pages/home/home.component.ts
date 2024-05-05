import { Component, inject } from "@angular/core";
import { CommonModule } from "@angular/common";
import { CategorieComponent } from "./categorie/categorie.component";
import { ProduitComponent } from "./produit/produit.component";
import { BanniereComponent } from "../../components/main-layout/header/banniere/banniere.component";
import { Product } from "../../model/Product";
import { Category } from "../../model/Category";
import { HomeService } from "../../service/home/home.service";

@Component({
  selector: "app-home",
  standalone: true,
  imports: [
    CommonModule,
    CategorieComponent,
    ProduitComponent,
    BanniereComponent,
  ],
  templateUrl: "./home.component.html",
  styleUrl: "./home.component.scss",
})
export class HomeComponent {
  products: Product[] = [];
  categories: Category[] = [];

  constructor(public homeService: HomeService) {}

  ngOnInit(): void {
    const data = this.homeService.getData();
    this.products = data.products;
    this.categories = data.categories;
  }
}
