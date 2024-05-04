import { Component } from "@angular/core";
import { RouterOutlet } from "@angular/router";

@Component({
  selector: "app-full-page-layout",
  standalone: true,
  imports: [RouterOutlet],
  templateUrl: "./full-page-layout.component.html",
  styleUrl: "./full-page-layout.component.scss",
})
export class FullPageLayoutComponent {}
