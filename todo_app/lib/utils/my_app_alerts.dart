import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/providers/task/task_provider.dart';
import 'package:todo_app/utils/extensions.dart';

class MyAppAlerts {
  const MyAppAlerts._();

  static showMySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.colorScheme.surface,
          ),
        ),
        backgroundColor: context.colorScheme.onSurface,
      ),
    );
  }

  static Future<void> showAlertDelete({
    required BuildContext context,
    required WidgetRef ref,
    required Task task,
  }) async {
    Widget cancelButton = TextButton(
      child: const Text('Cancel'),
      onPressed: () => context.pop(),
    );
    Widget deleteButton = TextButton(
      onPressed: () async {
        context.pop(); // case when click on task details
        await ref.read(taskProvider.notifier).deleteTask(task).then(
          (value) {
            showMySnackBar(
              context,
              'Task was deleted successfully!',
            );
            context.pop();
          },
        );
      },
      child: const Text('Confirm'),
    );

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: const Text(
            'Are you sure you want to mark this task as completed?',
          ),
          actions: [
            deleteButton,
            cancelButton,
          ],
        );
        ;
      },
    );
  }
}
