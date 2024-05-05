import { Component, inject } from "@angular/core";
import { CommonModule } from "@angular/common";
import { CategorieComponent } from "./categorie/categorie.component";
import { ProduitComponent } from "./produit/produit.component";
import { BanniereComponent } from "../../components/main-layout/header/banniere/banniere.component";
import { Product } from "../../model/Product";
import { Category } from "../../model/Category";
import { HomeService } from "../../service/home/home.service";
import { response } from "express";

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
    this.homeService.getData().subscribe((response) => {
      const data = response;
      this.products = data.produits;
      this.categories = data.categories;
      console.log(this.products);
    });
  }
}
