import { Component } from "@angular/core";
import { LoginService } from "../../../service/login/login.service";
import { FormsModule } from "@angular/forms";
import { CommonModule } from "@angular/common";

@Component({
  selector: "app-sign-in",
  standalone: true,
  imports: [FormsModule, CommonModule],
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
