import 'package:todo_api/services/todo_service.dart';

class TodoRepo {
  final todoService = TodoService();

  todoRepoGetList() async {
    final values = await todoService.getTodoList();
  }
}
