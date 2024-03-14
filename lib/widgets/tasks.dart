import 'package:flutter/material.dart';
import 'package:prime_time_app/models/task.dart';
import 'package:prime_time_app/widgets/tasks_list/tasks_list.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});
  @override
  State<StatefulWidget> createState() {
    return _TasksState();
  }
}

class _TasksState extends State<Tasks> {
  final List<Task> _registeredTasks = [
    Task(
      title: 'PrimeTimeApp',
      description: "App that helps people who struggles do time management",
      duration: 120,
      timeSpend: 10,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tasks')),
      body: Column(
          children: [Expanded(child: TasksList(tasks: _registeredTasks))]),
    );
  }
}
