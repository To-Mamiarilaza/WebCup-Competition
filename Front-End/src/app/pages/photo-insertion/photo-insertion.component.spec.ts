import { ComponentFixture, TestBed } from '@angular/core/testing';

import { PhotoInsertionComponent } from './photo-insertion.component';

describe('PhotoInsertionComponent', () => {
  let component: PhotoInsertionComponent;
  let fixture: ComponentFixture<PhotoInsertionComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [PhotoInsertionComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(PhotoInsertionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
