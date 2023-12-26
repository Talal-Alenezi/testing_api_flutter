import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_api/providers/todo_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final todoTitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool addFlag = context.watch<TodoProvider>().flag;

    return Scaffold(
        appBar: AppBar(
          actions: [
            ElevatedButton(
                onPressed: () {
                  if (addFlag) {
                    context
                        .read<TodoProvider>()
                        .createTodo(todoTitleController.text);
                    // todoTitleController.dispose();
                    context.read<TodoProvider>().setFlag(addFlag);
                  } else
                    context.read<TodoProvider>().setFlag(addFlag);
                },
                child: Text("Add")),
          ],
          title: Text("Text"),
        ),
        // Use Future builder to make a builder that depends on future type data
        // in future takes the data
        // in builder does stuff and then returns a list view
        body: addFlag
            ? TextField(
                controller: todoTitleController,
              )
            : FutureBuilder(
                future: context.read<TodoProvider>().getTodoList(),
                builder: (context, AsyncSnapshot snapshot) {
                  return (snapshot.connectionState == ConnectionState.waiting)
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Consumer<TodoProvider>(
                          builder: (context, value, child) => ListView.builder(
                            itemCount: value.todoList.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(value.todoList[index].todoName),
                                trailing: Checkbox(
                                  value: value.todoList[index].isComplete,
                                  onChanged: (checkBoxValue) {
                                    context.read<TodoProvider>().updateTodo(
                                        value.todoList[index].id,
                                        checkBoxValue);
                                  },
                                ),
                                leading: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    context
                                        .read<TodoProvider>()
                                        .deleteTodo(value.todoList[index].id);
                                  },
                                ),
                              );
                            },
                          ),
                        );
                }));
  }
}
