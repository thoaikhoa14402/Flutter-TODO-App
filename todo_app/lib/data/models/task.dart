import 'package:todo_app/utils/task_categories.dart';
import 'package:todo_app/utils/task_keys.dart';

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

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      TaskKeys.id: id,
      TaskKeys.title: title,
      TaskKeys.description: description,
      TaskKeys.category: category.name,
      TaskKeys.time: time,
      TaskKeys.date: date,
      TaskKeys.isCompleted: isCompleted ? 1 : 0,
    };
  }

  factory Task.fromJson(Map<String, dynamic> map) {
    return Task(
      id: map[TaskKeys.id],
      title: map[TaskKeys.title],
      description: map[TaskKeys.description],
      category: TaskCategories.stringToTaskCategory(map[TaskKeys.category]),
      time: map[TaskKeys.time],
      date: map[TaskKeys.date],
      isCompleted: map[TaskKeys.isCompleted] == 1 ? true : false,
    );
  }

  Task copyWith({
    int? id,
    String? title,
    String? description,
    TaskCategories? category,
    String? time,
    String? date,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      time: time ?? this.time,
      date: date ?? this.date,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
