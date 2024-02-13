import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/data/repositories/task_repository_declaration.dart';
import 'package:todo_app/data/source/data_source.dart';

class TaskRepositoryImplementation implements TaskRepository {
  final DataSource _dataSource;
  TaskRepositoryImplementation(this._dataSource);

  @override
  Future<Task> addTask(Task task) async {
    try {
      int taskId = await _dataSource.addTask(task);
      Task createdTask = task.copyWith(id: taskId);
      return createdTask;
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    try {
      await _dataSource.deleteTask(task);
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<List<Task>> getAllTasks() async {
    try {
      return await _dataSource.getAllTasks();
    } catch (e) {
      throw '$e';
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    try {
      await _dataSource.updateTask(task);
    } catch (e) {
      throw '$e';
    }
  }
}
