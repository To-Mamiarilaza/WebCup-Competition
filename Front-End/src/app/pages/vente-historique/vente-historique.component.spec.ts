import { ComponentFixture, TestBed } from '@angular/core/testing';

import { VenteHistoriqueComponent } from './vente-historique.component';

describe('VenteHistoriqueComponent', () => {
  let component: VenteHistoriqueComponent;
  let fixture: ComponentFixture<VenteHistoriqueComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [VenteHistoriqueComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(VenteHistoriqueComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
