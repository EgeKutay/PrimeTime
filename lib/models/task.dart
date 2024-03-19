import 'package:uuid/uuid.dart';

enum Category { project, excercise, other }

const uuid = Uuid();

class Task {
  Task({
    required this.title,
    required this.duration,
  }) : id = uuid.v4();
  final String id;
  final String title;
  final int duration;
}
