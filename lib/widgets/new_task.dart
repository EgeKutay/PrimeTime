import 'package:flutter/material.dart';
import 'package:prime_time_app/models/task.dart';

class NewTask extends StatefulWidget {
  const NewTask({super.key, required this.onAddTask});
  final void Function(Task task) onAddTask;
  @override
  State<NewTask> createState() {
    return _NewTaskState();
  }
}

class _NewTaskState extends State<NewTask> {
  final _titleController = TextEditingController();
  final _durationController = TextEditingController();

  void _submitTaskData() {
    final enteredDuration =
        int.tryParse(_durationController.text)?.toInt() ?? 0;
    final invalidDuration = enteredDuration <= 0;
    if (_titleController.text.trim().isEmpty && invalidDuration) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid input'),
          content: const Text('Please make sure you entered valid title'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okay'))
          ],
        ),
      );
      return;
    }

    widget.onAddTask(
      Task(title: _titleController.text, duration: enteredDuration),
    );
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _durationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(children: [
        TextField(
          controller: _titleController,
          maxLength: 30,
          decoration: const InputDecoration(
            label: Text('Title'),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                keyboardType: TextInputType.number,
                controller: _durationController,
                decoration: const InputDecoration(
                  label: Text('Duration'),
                ),
              ),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                _submitTaskData();
              },
              child: const Text('Save Task'),
            ),
            const SizedBox(width: 10),
          ],
        )
      ]),
    );
  }
}
