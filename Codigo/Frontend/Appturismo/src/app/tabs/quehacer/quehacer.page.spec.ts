import { ComponentFixture, TestBed } from '@angular/core/testing';
import { QuehacerPage } from './quehacer.page';

describe('QuehacerPage', () => {
  let component: QuehacerPage;
  let fixture: ComponentFixture<QuehacerPage>;

  beforeEach(() => {
    fixture = TestBed.createComponent(QuehacerPage);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
