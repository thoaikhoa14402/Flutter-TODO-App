import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/utils/extensions.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.task, this.onCompleted});
  final Task task;

  final void Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      child: Container(
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.all(9.0),
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          border: Border.all(
            width: 1,
            color: Colors.grey, // Set the border color to grey
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(9.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: task.category.color.withOpacity(0.3),
                border: Border.all(
                  width: 2,
                  color: task.category.color,
                ),
              ),
              child: Center(
                child: Icon(
                  task.category.icon,
                  color: task.category.color,
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    task.title,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${task.date} - ${task.time}',
                        style: context.textTheme.bodyMedium!.copyWith(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Checkbox(
              shape: const CircleBorder(),
              value: task.isCompleted,
              onChanged: onCompleted,
            )
          ],
        ),
      ),
    );
  }
}
