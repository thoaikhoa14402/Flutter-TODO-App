import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/repositories/task_repository_provider.dart';
import 'package:todo_app/providers/task/task_notifier.dart';
import 'package:todo_app/providers/task/task_state.dart';

final taskProvider = StateNotifierProvider<TaskNotifier, TaskState>((ref) {
  final repository = ref.watch(taskRepositoryProvider);
  return TaskNotifier(repository);
});
