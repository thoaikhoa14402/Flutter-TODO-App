import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/data/repositories/task_repository_declaration.dart';
import 'package:todo_app/providers/task/task_state.dart';

class TaskNotifier extends StateNotifier<TaskState> {
  TaskNotifier(this._taskRepository) : super(const TaskState.initial()) {
    // load all the task when user opens the application
    getTasks();
  }

  final TaskRepository _taskRepository;

  Future<void> createTask(Task task) async {
    try {
      await _taskRepository.addTask(task);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _taskRepository.deleteTask(task);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateTask(Task task) async {
    try {
      final isCompleted = !task.isCompleted;
      final updatedTask = task.copyWith(isCompleted: isCompleted);
      await _taskRepository.updateTask(updatedTask);
      getTasks();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void getTasks() async {
    try {
      final tasks = await _taskRepository.getAllTasks();
      state = state.copyWith(tasks: tasks);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
