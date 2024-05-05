import { Component, Input } from "@angular/core";

@Component({
  selector: "app-produit",
  standalone: true,
  imports: [],
  templateUrl: "./produit.component.html",
  styleUrl: "./produit.component.scss",
})
export class ProduitComponent {
  @Input() imagePath: string = "";
  @Input() utilisateur: string = "";
  @Input() titre: string = "";
  @Input() price: number = 0;
}
