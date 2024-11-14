import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/common/common.dart';
import 'package:todo_app/common/dart/extension/datetime_extension.dart';
import 'package:todo_app/common/widget/w_rounded_container.dart';
import 'package:todo_app/data/memory/vo_todo.dart';
import 'package:todo_app/screen/main/tab/todo/w_todo_status.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;

  const TodoItem(this.todo, {super.key});

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      margin: const EdgeInsets.only(bottom: 6),
      color: context.appColors.itemBackground,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          todo.dueDate.relativeDays.text.make(),
          Row(
            children: [
              TodoStatusWidget(todo),
              Expanded(child: todo.title.text.size(20).medium.make()),
              IconButton(onPressed: () async {}, icon: const Icon(EvaIcons.editOutline))
            ],
          )
        ],
      ),
    );
  }
}
