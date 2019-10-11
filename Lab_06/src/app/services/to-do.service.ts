import { Injectable } from '@angular/core';
import {Todo} from '../interfaces/todo';
//import { loadavg } from 'os';
//import { saveConfig } from '@ionic/core';
@Injectable({
  providedIn: 'root'
})
export class ToDoService {

  public tods: Todo[] = [];

  constructor() {
  }

  load(){

  }

  save(){

  }

  getTodo(id){

  }

  addTodo(todo){

  }
  
}
