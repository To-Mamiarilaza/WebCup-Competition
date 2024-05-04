import { Component, Input } from "@angular/core";
import { ItemComponent } from "../item/item.component";
import { CommonModule } from "@angular/common";

@Component({
  selector: "app-product-sheet",
  standalone: true,
  imports: [CommonModule, ItemComponent],
  templateUrl: "./product-sheet.component.html",
  styleUrl: "./product-sheet.component.scss",
})
export class ProductSheetComponent {
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
}
