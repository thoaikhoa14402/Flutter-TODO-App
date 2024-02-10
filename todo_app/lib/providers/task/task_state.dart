import 'package:todo_app/data/models/task.dart';

class TaskState {
  const TaskState({
    required this.tasks,
  });

  final List<Task> tasks;

  const TaskState.initial({
    this.tasks = const [],
  });

  TaskState copyWith({
    List<Task>? tasks,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
    );
  }
}
