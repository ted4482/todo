import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:nav/dialog/dialog.dart';
import 'package:todo_app/common/common.dart';
import 'package:todo_app/common/dart/extension/datetime_extension.dart';
import 'package:todo_app/common/util/app_keyboard_util.dart';
import 'package:todo_app/common/widget/scaffold/bottom_dialog_scaffold.dart';
import 'package:todo_app/common/widget/w_round_button.dart';
import 'package:todo_app/common/widget/w_rounded_container.dart';
import 'package:todo_app/screen/main/write/vo_write_todo_result.dart';

class WriteTodoDialog extends DialogWidget<WriteTodoResult> {
  WriteTodoDialog({super.key});

  @override
  DialogState<WriteTodoDialog> createState() => _WriteTodoDialogState();
}

class _WriteTodoDialogState extends DialogState<WriteTodoDialog> with AfterLayoutMixin {
  DateTime _selectedDate = DateTime.now();
  final textController = TextEditingController();
  final node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BottomDialogScaffold(
      body: RoundedContainer(
        color: context.backgroundColor,
        child: Column(
          children: [
            Row(
              children: [
                '할 일을 작성해주세요.'.text.size(18).bold.make(),
                spacer,
                _selectedDate.formattedDate.text.make(),
                IconButton(onPressed: _selectDate, icon: const Icon(Icons.calendar_month)),
              ],
            ),
            height20,
            Row(
              children: [
                Expanded(
                    child: TextField(
                  focusNode: node,
                  controller: textController,
                )),
                RoundButton(text: '추가', onTap: () {
                  widget.hide(WriteTodoResult(_selectedDate, textController.text));
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _selectDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 10)),
    );

    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    AppKeyboardUtil.show(context, node);
  }
}
