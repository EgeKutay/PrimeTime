import 'package:flutter/material.dart';
import 'package:prime_time_app/models/task.dart';
import 'package:prime_time_app/widgets/tasks_list/task_item.dart';

class TasksList extends StatelessWidget {
  const TasksList(
      {super.key,
      required this.tasks,
      required this.onRemoveTask,
      required this.onCompleteTask});
  final List<Task> tasks;
  final void Function(Task task) onRemoveTask;
  final void Function(Task task) onCompleteTask;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(tasks[index]),
        confirmDismiss: (DismissDirection direction) async {
          if (direction == DismissDirection.endToStart) {
            return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Confirm"),
                  content:
                      const Text("Are you sure you wish to delete this task?"),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text("Delete")),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("CANCEL"),
                    ),
                  ],
                );
              },
            );
          } else {
            return await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("Confirm"),
                  content: const Text(
                      "This task will be marked as completed. Are you sure?"),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text("Yes")),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("No"),
                    ),
                  ],
                );
              },
            );
          }
        },
        direction: DismissDirection.horizontal,
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            onRemoveTask(tasks[index]);
          } else {
            onCompleteTask(tasks[index]);
          }
        },
        child: TaskItem(tasks[index]),
      ),
    );
  }
}
