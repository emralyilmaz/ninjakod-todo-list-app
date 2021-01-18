import 'package:flutter/material.dart';
import 'package:todo_list_app/model/task.dart';

class TaskListTile extends StatelessWidget {
  final Task item;
  final Function onTaskStatusChange;
  final Function onDelete;

  const TaskListTile(
      {Key key, this.item, this.onTaskStatusChange, this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.taskName),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            Checkbox(value: item.isDone, onChanged: onTaskStatusChange),
            IconButton(icon: Icon(Icons.delete), onPressed: onDelete)
          ],
        ),
      ),
    );
  }
}
