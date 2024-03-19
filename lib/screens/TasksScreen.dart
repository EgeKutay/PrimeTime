import 'package:flutter/material.dart';
import 'package:prime_time_app/models/task.dart';
import 'package:prime_time_app/widgets/tasks_list/tasks_list.dart';
import 'package:prime_time_app/widgets/new_task.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TasksScreenState();
  }
}

class _TasksScreenState extends State<TasksScreen> {
  final List<Task> _registeredTasks = [
    Task(
      title: 'PrimeTimeApp',
      duration: 120,
    )
  ];
  void _addTask(Task task) {
    setState(() {
      _registeredTasks.add(task);
    });
  }

  void _openAddTaskOverlay() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => NewTask(onAddTask: _addTask));
  }

  _removeTask(Task task) {
    setState(() {
      _registeredTasks.remove(task);
    });
  }

  _completeTask(Task task) {
    setState(() {
      _registeredTasks.remove(task);
      //implement complete list additive here.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
        actions: [
          IconButton(
            onPressed: _openAddTaskOverlay,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Column(children: [
        Expanded(
            child: TasksList(
          tasks: _registeredTasks,
          onRemoveTask: _removeTask,
          onCompleteTask: _completeTask,
        ))
      ]),
    );
  }
}
