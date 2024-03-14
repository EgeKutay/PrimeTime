import 'package:flutter/material.dart';
import 'package:prime_time_app/models/task.dart';
import 'package:prime_time_app/widgets/tasks_list/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key, required this.tasks});
  final List<Task> tasks;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.all(1.0),
        child: TaskItem(tasks[index]),
      ),
    );
  }
}
