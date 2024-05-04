import { inject } from "@angular/core";
import { CanActivateFn, Router } from "@angular/router";
import { AuthService } from "../service/auth/auth.service";

export const authGuard: CanActivateFn = (route, state) => {
  const authService = inject(AuthService);
  const router = inject(Router);

  console.log("authGuard", authService.isAuthenticated());
  if (authService.isAuthenticated()) {
    console.log("authGuard", "authenticated");
    router.navigate(["/main"]);
    return true;
  }
  return false;
};
