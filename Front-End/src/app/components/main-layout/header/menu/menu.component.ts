import { Component } from '@angular/core';
import { NavbarBrandComponent } from '../navbar-brand/navbar-brand.component';
import { NavbarLinkComponent } from '../navbar-link/navbar-link.component';
import { SidebarSmallComponent } from '../sidebar-small/sidebar-small.component';
import { TopSearchComponent } from '../top-search/top-search.component';

@Component({
  selector: 'app-menu',
  standalone: true,
  imports: [NavbarBrandComponent, NavbarLinkComponent, SidebarSmallComponent, TopSearchComponent],
  templateUrl: './menu.component.html',
  styleUrl: './menu.component.scss'
})
export class MenuComponent {
  floatDropState: Number = 0;

  displayFloatDrop(floatDrop: any) {
    // Close all other float drop
    var elements = document.getElementsByClassName("float-drop-nav");
    for (let i = 0; i < elements.length; i++) {
      elements[i].classList.remove('d-block');      
      elements[i].classList.add('d-none');      
    }

    floatDrop.classList.remove('d-none');
    floatDrop.classList.add('d-block');
    this.floatDropState = 0;
  }

  prepareFloatDrop() {
    this.floatDropState = 1;
  }

  hideFloatDrop(floatDrop: any) {
    if (this.floatDropState == 1) {
      floatDrop.classList.remove('d-block');
      floatDrop.classList.add('d-none');
      this.floatDropState = 0;
    } 
  }

  openSidebarContainer(sidebar: HTMLElement) {
    sidebar.classList.add('open-sidebar-container');
  }

  closeSidebarContainer(sidebar: HTMLElement) {
    sidebar.classList.remove('open-sidebar-container');
  }
}
