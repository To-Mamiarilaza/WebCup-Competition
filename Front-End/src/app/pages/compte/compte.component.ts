import { Component } from '@angular/core';
import { AvatarComponent } from './avatar/avatar.component';

@Component({
  selector: 'app-compte',
  standalone: true,
  imports: [AvatarComponent],
  templateUrl: './compte.component.html',
  styleUrl: './compte.component.scss'
})
export class CompteComponent {

}
