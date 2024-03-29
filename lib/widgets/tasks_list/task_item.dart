import 'package:flutter/material.dart';
import 'package:prime_time_app/models/task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem(this.task, {super.key});
  final Task task;
  void _removeTaskPopup() {
    AlertDialog(
      actions: [
        TextButton(
          onPressed: () {},
          child: const Text('Accept'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  task.title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
            Row(
              children: [Text(task.duration.toString())],
            )
          ],
        ),
      ),
    );
  }
}
