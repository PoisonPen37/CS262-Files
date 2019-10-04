import { Component, OnInit } from '@angular/core';
import {Todo} from '../interfaces/todo';

@Component({
  selector: 'app-edit-to-do',
  templateUrl: './edit-to-do.page.html',
  styleUrls: ['./edit-to-do.page.scss'],
})
export class EditToDoPage implements OnInit {

  private todo: Todo;
  constructor() {
    this.todo = {
      id: 0,
      title: '',
      description: ''

    };
  }

  ngOnInit() {
    // Grab ID from route
  }

  saveTodo(){

  }

}
