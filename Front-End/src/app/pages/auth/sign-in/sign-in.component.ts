import { Component } from "@angular/core";
import { LoginService } from "../../../service/login/login.service";
import { FormsModule } from "@angular/forms";
import { CommonModule } from "@angular/common";
import { RouterLink } from "@angular/router";

@Component({
  selector: "app-sign-in",
  standalone: true,
  imports: [FormsModule, CommonModule, RouterLink],
  templateUrl: "./sign-in.component.html",
  styleUrl: "./sign-in.component.scss",
})
export class SignInComponent {
  email: string = "";
  password: string = "";
  loading$ = this.loginService.loading$;
  error$ = this.loginService.error$;

  constructor(public loginService: LoginService) {}

  signIn() {
    this.loginService.signin({ email: this.email, password: this.password });
  }
}
