import { Component, Input, OnInit } from "@angular/core";
import { ItemComponent } from "../item/item.component";
import { CommonModule } from "@angular/common";
import { ProductSheet } from "../../../models/ProductSheet";
import { HttpClient, HttpHeaders } from "@angular/common/http";
import { StorageService } from "../../../service/storage/storage.service";
import { env } from "../../../environments/env";
import { Subscription } from "rxjs";
import { ActivatedRoute } from "@angular/router";

@Component({
  selector: "app-product-sheet",
  standalone: true,
  imports: [CommonModule, ItemComponent],
  templateUrl: "./product-sheet.component.html",
  styleUrl: "./product-sheet.component.scss",
})
export class ProductSheetComponent implements OnInit{
  @Input() imagesPath: string[] = [
    "assets/images/2.jpg",
    "assets/images/1.jpg",
    "assets/images/4.jpg",
    "assets/images/3.jpg",
    "assets/images/5.jpg",
  ];
  @Input() title: string = "Lunette de soleil";
  @Input() price: string = "22Kc";
  @Input() by: string = "Rindra Rakoto";
  @Input() contact: string = "034 14 534 34";
  @Input() description: string =
    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec purus feugiat, molestie ipsum et, consequat nibh. Etiam non elit dui. Nullam vel eros sit amet arcu vestibulum accumsan in in leo. Sed vitae odio sit amet quam.";
  @Input() category: string = "Vetements et accessoires";


  productId: string = "";
  routeSubscription: Subscription;
  productSheet: ProductSheet | null = null;
  headers: HttpHeaders = new HttpHeaders({});
  current_page: number = 1;
  page_number: number = 1;

  constructor(private http: HttpClient, private storageService: StorageService, private route: ActivatedRoute) {
    this.routeSubscription = new Subscription();  
  }

  ngOnInit(): void {
    this.updateHeaders();
    this.routeSubscription = this.route.params.subscribe(params => {
      this.productId = params['productId'];
    });
    this.updateProductSheet();
  }
  ngOnDestroy(): void {
    this.routeSubscription.unsubscribe();
  }
  updateHeaders(): void {
    const accessToken = this.storageService.getItem("access_token");
    if (accessToken)  this.headers = new HttpHeaders({ 'ApiToken': accessToken });
  }
  // detail-produit/id-produit
  updateProductSheet(): void {
    this.http.get<any>(env.baseUrl + "/detail-produit/" + this.productId , { headers: this.headers})
    .subscribe(data => {
      console.log(data);
      this.productSheet = data.produit;
      this.title = this.productSheet?.titre || "";
      this.price = String(this.productSheet?.prix) || "0";
      this.by = this.productSheet?.utilisateur || "";
      this.contact = this.productSheet?.ville || "";
      this.description = this.productSheet?.description || "";
      this.category = this.productSheet?.categorie || "";
      this.imagesPath = []
      for (let key in data.produitPhotos) {
        if (data.produitPhotos.hasOwnProperty(key)) {
          this.imagesPath.push(data.produitPhotos[key].url);
        }
      }
    })
  }
}
