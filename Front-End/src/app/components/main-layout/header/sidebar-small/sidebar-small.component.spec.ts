import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SidebarSmallComponent } from './sidebar-small.component';

describe('SidebarSmallComponent', () => {
  let component: SidebarSmallComponent;
  let fixture: ComponentFixture<SidebarSmallComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [SidebarSmallComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(SidebarSmallComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
