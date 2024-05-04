import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ProductSheetComponent } from './product-sheet.component';

describe('ProductSheetComponent', () => {
  let component: ProductSheetComponent;
  let fixture: ComponentFixture<ProductSheetComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ProductSheetComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ProductSheetComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
