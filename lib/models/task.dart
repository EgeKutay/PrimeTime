import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

enum Category { project, excercise, other }

const uuid = Uuid();

class Task {
  Task(
      {required this.title,
      required this.description,
      required this.duration,
      required this.timeSpend})
      : id = uuid.v4();
  final String id;
  final String title;
  final String description;
  final int duration;
  final int timeSpend;
}
