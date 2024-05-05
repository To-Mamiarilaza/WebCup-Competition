import { Routes } from "@angular/router";
import { HomeComponent } from "./pages/home/home.component";
import { MainLayoutComponent } from "./components/main-layout/main-layout.component";
import { FullPageLayoutComponent } from "./components/full-page-layout/full-page-layout.component";
import { SignInComponent } from "./pages/auth/sign-in/sign-in.component";
import { SignUpComponent } from "./pages/auth/sign-up/sign-up.component";
import { PageNotFoundComponent } from "./pages/error/page-not-found/page-not-found.component";
import { ProductSheetComponent } from "./pages/product/product-sheet/product-sheet.component";
import { TransactionComponent } from "./pages/transaction/transaction.component";
import { TokenPurchaseComponent } from "./pages/token-purchase/token-purchase.component";
import { ImageUploadComponent } from "./components/image-upload/image-upload.component";
import { authGuard } from "./guard/auth.guard";
import { ListProduitComponent } from "./pages/list-produit/list-produit.component";
import { VenteHistoriqueComponent } from "./pages/vente-historique/vente-historique.component";
import { NewVenteComponent } from "./pages/new-vente/new-vente.component";
import { PhotoInsertionComponent } from "./pages/photo-insertion/photo-insertion.component";

export const routes: Routes = [
  {
    path: "main",
    component: MainLayoutComponent,
    children: [
      { path: "", component: HomeComponent, title: "Accueil" },
      {
        path: "product/:productId",
        component: ProductSheetComponent,
        title: "Fiche produit",
      },
      {
        path: "transaction",
        component: TransactionComponent,
        title: "Transactions",
      },
      {
        path: "token-purchase",
        component: TokenPurchaseComponent,
        title: "Achat jetons",
      },
      {
        path: "list-produit",
        component: ListProduitComponent,
        title: "Listes des produits",
      },
      {
        path: "upload-image",
        component: ImageUploadComponent,
        title: "Test upload image",
      },
      {
        path: "historique-vente",
        component: VenteHistoriqueComponent,
        title: "Historique de vente"
      },
      {
        path: "new-vente",
        component: NewVenteComponent,
        title: "Nouvelle vente"
      },
      {
        path: "photo-insertion",
        component: PhotoInsertionComponent,
        title: "Nouvelle vente"
      }
    ],
  },
  {
    path: "page",
    component: FullPageLayoutComponent,
    children: [
      {
        path: "sign-in",
        component: SignInComponent,
        title: "Se connecter",
      },
      {
        path: "sign-up",
        component: SignUpComponent,
        title: "S'inscrire",
      },
    ],
  },
  { path: "", redirectTo: "/main", pathMatch: "full" },
  { path: "**", component: PageNotFoundComponent },
];
