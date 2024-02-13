import 'package:todo_app/data/models/task.dart';

abstract class TaskRepository {
  // Note: addTask() returns Task because we need information to setup the notification about this task
  Future<Task> addTask(Task task);
  Future<void> deleteTask(Task task);
  Future<void> updateTask(Task task);
  Future<List<Task>> getAllTasks();
}
