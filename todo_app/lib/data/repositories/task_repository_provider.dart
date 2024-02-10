import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/repositories/task_repository_declaration.dart';
import 'package:todo_app/data/repositories/task_repository_implementation.dart';
import 'package:todo_app/data/source/data_source_provider.dart';

final taskRepositoryProvider = Provider<TaskRepository>((ref) {
  final dataSource = ref.read(taskDataSourceProvider);
  return TaskRepositoryImplementation(dataSource);
});
