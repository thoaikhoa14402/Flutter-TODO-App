import 'package:todo_app/utils/task_categories.dart';

class Task {
  Task(
      {this.id,
      required this.title,
      required this.description,
      required this.time,
      required this.date,
      required this.category,
      required this.isCompleted});

  final int? id;
  final String title;
  final String description;
  final String time;
  final String date;
  final bool isCompleted;
  final TaskCategories category;
}
