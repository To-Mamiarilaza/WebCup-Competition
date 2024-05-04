import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BanniereComponent } from './banniere.component';

describe('BanniereComponent', () => {
  let component: BanniereComponent;
  let fixture: ComponentFixture<BanniereComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [BanniereComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(BanniereComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
