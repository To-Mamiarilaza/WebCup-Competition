import { Component } from "@angular/core";
import { RouterLink, RouterModule } from "@angular/router";

@Component({
  selector: "app-page-not-found",
  standalone: true,
  imports: [RouterLink, RouterModule],
  templateUrl: "./page-not-found.component.html",
  styleUrl: "./page-not-found.component.scss",
})
export class PageNotFoundComponent {}
