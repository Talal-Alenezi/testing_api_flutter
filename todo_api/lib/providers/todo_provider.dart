import 'package:flutter/material.dart';
import 'package:todo_api/models/todo_model.dart';
import 'package:todo_api/services/todo_service.dart';

// after the service class make the provider that call the service get
class TodoProvider extends ChangeNotifier {
  List<Todo> todoList = [];
  bool flag = false;

  final _todoService = TodoService();

  Future<void> getTodoList() async {
    todoList = await _todoService.getTodoList();
    notifyListeners();
  }

  createTodo(String todoTitle) async {
    await _todoService.createTodo(todoTitle, false);
    await getTodoList();
    // notifyListeners();
  }

  updateTodo(String id, bool? isComplete) async {
    await _todoService.updateTodo(id, isComplete);
    await getTodoList();
    // notifyListeners();
  }

  deleteTodo(String id) async {
    await _todoService.deleteTodo(id);
    await getTodoList();
    // notifyListeners();
  }

  setFlag(bool value) {
    flag = !value;
    notifyListeners();
  }
}
