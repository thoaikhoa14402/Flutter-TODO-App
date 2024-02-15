import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/services/notification_service.dart';
import 'package:todo_app/utils/task_filter.dart';

class Helpers {
  Helpers._();

  static String dateToString(DateTime date) {
    try {
      return DateFormat.yMMMd().format(date);
    } catch (e) {
      return 'July, 16';
    }
  }

  static String timeToString(TimeOfDay time) {
    try {
      final DateTime now = DateTime.now();
      final date =
          DateTime(now.year, now.month, now.day, time.hour, time.minute);
      return DateFormat.jm().format(date);
    } catch (e) {
      return '7:30PM';
    }
  }

  static DateTime _parseTaskDateTime(String taskDate, String taskTime) {
    final DateTime parsedDate = DateFormat.yMMMd().parse(taskDate);
    final DateTime parsedTime = DateFormat.jm().parse(taskTime);

    return DateTime(
      parsedDate.year,
      parsedDate.month,
      parsedDate.day,
      parsedTime.hour,
      parsedTime.minute,
    );
  }

  static bool isTaskDueDateToday(String taskDate) {
    final DateTime parsedDate = DateFormat.yMMMd().parse(taskDate);
    final DateTime now = DateTime.now();

    return parsedDate.year == now.year &&
        parsedDate.month == now.month &&
        parsedDate.day == now.day;
  }

  static List<Task> filterListTasks(List<Task> tasks, TaskFilter filter) {
    final DateTime now = DateTime.now();
    final DateTime today = DateTime(now.year, now.month, now.day);
    List<Task> filteredTasks;
    switch (filter) {
      case TaskFilter.today:
        filteredTasks = tasks.where((task) {
          final taskDate = _parseTaskDateTime(task.date, task.time);
          return taskDate.year == today.year &&
              taskDate.month == today.month &&
              taskDate.day == today.day;
        }).toList();
        break;
      case TaskFilter.upcoming:
        filteredTasks = tasks
            .where(
                (task) => _parseTaskDateTime(task.date, task.time).isAfter(now))
            .toList();
        break;
    }
    // Sort tasks by time in descending order
    filteredTasks.sort((a, b) {
      DateTime timeA = _parseTaskDateTime(a.date, a.time);
      DateTime timeB = _parseTaskDateTime(b.date, b.time);
      return timeA.compareTo(timeB); // Descending order
    });

    return filteredTasks;
  }

  static void scheduledNotification(Task task) {
    final scheduledDate = _parseTaskDateTime(task.date, task.time).subtract(
      const Duration(minutes: 10),
    );

    NotificationService.scheduledNotification(
        task: task, scheduledDate: scheduledDate);
  }
}
