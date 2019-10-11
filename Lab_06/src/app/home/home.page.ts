import { Component } from '@angular/core';
import { ToDoService } from '../services/to-do.service';

@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss'],
})
export class HomePage {

  constructor(public TodoService: ToDoService) {}

}
