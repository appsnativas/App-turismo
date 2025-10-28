import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';
import { IonContent, IonHeader, IonTitle, IonToolbar, IonCard, IonCardContent, IonCardTitle, IonCardHeader, IonLabel, IonIcon, IonItem, IonList, IonImg } from '@ionic/angular/standalone';

@Component({
  selector: 'app-destino',
  templateUrl: './destino.page.html',
  styleUrls: ['./destino.page.scss'],
  standalone: true,
  imports: [IonContent, IonHeader, IonTitle, IonToolbar, CommonModule, FormsModule, IonCard, IonCardContent, IonCardTitle, IonCardHeader, IonLabel, IonIcon, IonItem, IonList, IonImg]
})
export class DestinoPage implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}
