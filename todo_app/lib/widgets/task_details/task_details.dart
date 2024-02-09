import 'package:flutter/material.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/task_details/description.dart';
import 'package:todo_app/widgets/task_details/due_date.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      child: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                  width: 24,
                ),
                Text(
                  task.title,
                  style: context.textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            DueDate(time: task.time, date: task.date),
            const SizedBox(height: 8),
            Divider(
              thickness: 1.5,
              color: task.category.color,
            ),
            const SizedBox(height: 8),
            TaskDescription(
                description: task.description.isEmpty
                    ? 'There is no description for this task'
                    : task.description),
            const SizedBox(height: 84),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple, // Button background color
                  foregroundColor: Colors.white, // Text color
                ),
                child: Text(
                  'Mark as Done',
                  style: context.textTheme.bodyLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
    // return const Text('By default');
  }
}
