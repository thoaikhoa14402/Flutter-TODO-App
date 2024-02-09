import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/widgets/task_details/task_details.dart';
import 'package:todo_app/widgets/task_item.dart';

class ListOfTasks extends StatelessWidget {
  const ListOfTasks(
      {super.key, this.isCompletedTasks = false, required this.tasks});

  final bool isCompletedTasks;
  final List<Task> tasks;

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(
        child: Text(
          'There is no task todo!',
          style: GoogleFonts.montserrat(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return InkWell(
            onLongPress: () {
              // Delete task
            },
            onTap: () async {
              // Show task details
              await showModalBottomSheet(
                context: context,
                builder: (ctx) {
                  return TaskDetails(task: task);
                },
              );
            },
            child: TaskItem(task: task),
          );
        },
      );
    }
  }
}
