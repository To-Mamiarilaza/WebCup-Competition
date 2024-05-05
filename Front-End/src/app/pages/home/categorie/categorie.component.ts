import { Component, Input } from "@angular/core";

@Component({
  selector: "app-categorie",
  standalone: true,
  imports: [],
  templateUrl: "./categorie.component.html",
  styleUrl: "./categorie.component.scss",
})
export class CategorieComponent {
  @Input() name: string = "";
}
