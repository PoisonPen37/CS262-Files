import { Component } from '@angular/core';
import { NativeStorage } from '@ionic-native/native-storage/ngx';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  constructor(private nativeStorage: NativeStorage) {
    this.nativeStorage.setItem('freakyItem1', { property: 'value', anotherProperty: 'anotherValue' })
      .then(
        (data) => console.log('Stored first item!',data),
        error => console.error('Error storing item', error)
      );

    this.nativeStorage.getItem('freakyItem1')
    .then(
      data => console.log(data),
      error => console.error(error)
    );
    
  }

}
