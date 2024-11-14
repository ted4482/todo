import 'package:flutter/material.dart';
import 'package:todo_app/common/common.dart';
import 'package:todo_app/screen/main/tab/todo/w_todo_item.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: context.todoHolder.notifier,
      builder: (context, todoList, child) {
        return todoList.isEmpty
            ? '할 일을 작성해보세요.'.text.size(30).makeCentered()
            : Column(
                children: todoList.map((e) => TodoItem(e)).toList(),
              );
      },
    );
  }
}
