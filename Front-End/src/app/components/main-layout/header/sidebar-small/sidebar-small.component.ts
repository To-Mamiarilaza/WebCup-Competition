import { Component } from '@angular/core';

@Component({
  selector: 'app-sidebar-small',
  standalone: true,
  imports: [],
  templateUrl: './sidebar-small.component.html',
  styleUrl: './sidebar-small.component.scss'
})
export class SidebarSmallComponent {
  sidebarState: boolean = false;

  changeSidebarState() {
    this.sidebarState = !this.sidebarState;
  }
}
