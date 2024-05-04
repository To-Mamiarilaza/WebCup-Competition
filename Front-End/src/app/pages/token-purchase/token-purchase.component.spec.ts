import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TokenPurchaseComponent } from './token-purchase.component';

describe('TokenPurchaseComponent', () => {
  let component: TokenPurchaseComponent;
  let fixture: ComponentFixture<TokenPurchaseComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [TokenPurchaseComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(TokenPurchaseComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
