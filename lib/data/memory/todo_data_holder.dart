import 'package:flutter/material.dart';
import 'package:todo_app/data/memory/e_todo_status.dart';
import 'package:todo_app/data/memory/todo_data_notifier.dart';
import 'package:todo_app/data/memory/vo_todo.dart';
import 'package:todo_app/screen/dialog/d_confirm.dart';

class TodoDataHolder extends InheritedWidget {
  final TodoDataNotifier notifier;

  const TodoDataHolder({
    super.key,
    required super.child,
    required this.notifier,
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static TodoDataHolder _of(BuildContext context) {
    TodoDataHolder inherited = (context.dependOnInheritedWidgetOfExactType<TodoDataHolder>())!;
    return inherited;
  }

  Future<void> changeTodoStatus(Todo todo) async {
    switch (todo.status) {
      case TodoStatus.incomplete:
        todo.status = TodoStatus.ongoing;
      case TodoStatus.ongoing:
        todo.status = TodoStatus.complete;
      case TodoStatus.complete:
        final confirm = await ConfirmDialog("처음 상태로 돌리시겠어요?").show();
        confirm?.runIfSuccess((data) {
          todo.status = TodoStatus.incomplete;
        });
    }
  }
}

extension TodoDataHolderContextExtension on BuildContext {
  TodoDataHolder get todoHolder => TodoDataHolder._of(this);
}
