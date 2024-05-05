import { TestBed } from '@angular/core/testing';

import { ListProduitService } from './list-produit.service';

describe('ListProduitService', () => {
  let service: ListProduitService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ListProduitService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
