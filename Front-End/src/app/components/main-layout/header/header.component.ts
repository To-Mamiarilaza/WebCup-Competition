import { Component } from '@angular/core';
import { MenuComponent } from './menu/menu.component';
import { BanniereComponent } from './banniere/banniere.component';

@Component({
  selector: 'app-header',
  standalone: true,
  imports: [MenuComponent, BanniereComponent],
  templateUrl: './header.component.html',
  styleUrl: './header.component.scss'
})
export class HeaderComponent {

}
