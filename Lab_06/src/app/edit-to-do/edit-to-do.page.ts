import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import {Todo} from '../interfaces/todo';

@Component({
  selector: 'app-edit-to-do',
  templateUrl: './edit-to-do.page.html',
  styleUrls: ['./edit-to-do.page.scss'],
})
export class EditToDoPage implements OnInit {

  private todo: Todo;
  constructor(private route: ActivatedRoute) {
    this.todo = {
      id: 0,
      title: '',
      description: ''

    };
  }

  ngOnInit() {
    let id = this.route.snapshot.paramMap.get('id');
    console.log(id);
  }

  saveTodo(){

  }

}
