import { inject } from "@angular/core";
import { CanActivateFn, Router } from "@angular/router";
import { AuthService } from "../service/auth/auth.service";

export const authGuard: CanActivateFn = (route, state) => {
  const authService = inject(AuthService);
  const router = inject(Router);

  console.log("authGuard", authService.isAuthenticated());
  if (authService.isAuthenticated()) {
    console.log("taf");
    router.navigate(["/main"]);
    return false;
  }
  return true;
};
