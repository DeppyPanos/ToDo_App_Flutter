import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallback;
  final Function longPressDelete;

  TaskTile(
      {this.isChecked,
      this.taskTitle,
      @required this.checkboxCallback,
      this.longPressDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //instead of using a Row and a CheckBox
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 20.0,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.pinkAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
      onLongPress: longPressDelete,
    );
  }
}
