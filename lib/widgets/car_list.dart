import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_list_item.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;

  TaskList({@required this.tasks});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: getChildrenTasks(),
    );
  }

  List<TaskListItem> getChildrenTasks() {
    return tasks
        .map((task) => TaskListItem(
      task: task,
    ))
        .toList();
  }
}
