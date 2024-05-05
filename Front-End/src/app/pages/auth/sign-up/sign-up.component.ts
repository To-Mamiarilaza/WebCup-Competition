import { CommonModule } from "@angular/common";
import { Component } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { RegisterService } from "../../../service/register/register.service";
import { File } from "buffer";
import { RouterLink } from "@angular/router";

@Component({
  selector: "app-sign-up",
  standalone: true,
  imports: [CommonModule, FormsModule, RouterLink],
  templateUrl: "./sign-up.component.html",
  styleUrl: "./sign-up.component.scss",
})
export class SignUpComponent {
  email: string = "";
  password: string = "";
  passwordConfirm: string = "";
  contact: string = "";
  avatar: string = "";
  username: string = "";

  constructor(private registerService: RegisterService) {}

  loading$ = this.registerService.loading$;
  error$ = this.registerService.error$;

  signUp() {
    this.registerService.signUp({
      email: this.email,
      password: this.password,
      telephone: this.contact,
      avatar: this.avatar,
      name: this.username,
      profile: 0,
    });
  }
}
