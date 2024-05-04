import { ChangeDetectorRef, Component } from '@angular/core';

@Component({
  selector: 'app-top-search',
  standalone: true,
  imports: [],
  templateUrl: './top-search.component.html',
  styleUrl: './top-search.component.scss'
})
export class TopSearchComponent {
  placeholderDynamique: string = '';
  placeholderText: string = 'Tapez le nom de votre produit ici ...';

  constructor(private cdr: ChangeDetectorRef) {}

  ngOnInit() {
    // this.animateSearchInput();
  }
  
  animateSearchInput () {
      this.placeholderDynamique = "";
      this.showPlaceholderText(this.placeholderText, 0, 50);
  }

  showPlaceholderText(text: string, i: number, interval: number) {
    if (i < text.length) {
      this.placeholderDynamique += text[i];
      i++;
      this.cdr.detectChanges();

      setTimeout(() => {
        this.showPlaceholderText(text, i, interval);
      }, interval);
    }
  }
}
