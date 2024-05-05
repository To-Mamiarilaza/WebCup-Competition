import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NewVenteComponent } from './new-vente.component';

describe('NewVenteComponent', () => {
  let component: NewVenteComponent;
  let fixture: ComponentFixture<NewVenteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [NewVenteComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(NewVenteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
