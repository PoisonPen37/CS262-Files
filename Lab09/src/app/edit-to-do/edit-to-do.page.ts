import { Component, OnInit } from '@angular/core';
import { NavController } from '@ionic/angular';
import { ActivatedRoute } from '@angular/router';
import {Todo} from '../interfaces/todo';
import { ToDoService } from '../services/to-do.service';

@Component({
  selector: 'app-edit-to-do',
  templateUrl: './edit-to-do.page.html',
  styleUrls: ['./edit-to-do.page.scss'],
})
export class EditToDoPage implements OnInit {

  private todo: Todo;
  private editMode: boolean = false;

  constructor(private route: ActivatedRoute, private todoService: ToDoService, private navCtrl: NavController) {
    this.todo = {
      id: this.todoService.todos.length,
      title: '',
      description: ''

    };
  }

  ngOnInit() {
    let id = this.route.snapshot.paramMap.get('id');
    if(id != null){
      this.todoService.load().then(() => {
        this.editMode = true;
        this.todo = this.todoService.getTodo(id);
      });
    }
  }

  saveTodo(){
    if(this.editMode){
      this.todoService.save();
    } else{
      this.todoService.addTodo(this.todo);
    }
    this.navCtrl.navigateBack('/home');
  }

}
