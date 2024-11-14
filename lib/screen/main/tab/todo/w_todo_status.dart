import 'package:flutter/material.dart';
import 'package:todo_app/common/common.dart';
import 'package:todo_app/data/memory/vo_todo.dart';

class TodoStatusWidget extends StatelessWidget {
  final Todo todo;

  const TodoStatusWidget(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tap(
      onTap: () => context.todoHolder.changeTodoStatus(todo),
      child: SizedBox(
        width: 50,
        height: 50,
        child: Checkbox(
          value: true,
          onChanged: null,
          fillColor: WidgetStateProperty.all(context.appColors.checkBoxColor),
        ),
      ),
    );
  }
}
