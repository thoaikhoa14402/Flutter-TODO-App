import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/create_new_task/common_text_field.dart';

class CreateTaskScreen extends StatelessWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: Text(
          'Create New Task',
          style: context.textTheme.titleLarge!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CommonTextField(
              title: 'Task Title',
              hintText: 'Enter your task title',
              prefixIcon: Icon(Icons.event_note),
            ),
            const SizedBox(height: 24),
            const CommonTextField(
              title: 'Task Description',
              hintText: 'Enter your task description',
              maxLines: 4,
            ),
            const SizedBox(height: 24),
            const Row(
              children: [
                Expanded(
                  child: CommonTextField(
                    title: 'Date',
                    hintText: 'Feb 20, 2024',
                    prefixIcon: Icon(Icons.calendar_today),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: CommonTextField(
                    title: 'Time',
                    hintText: '7:30',
                    prefixIcon: Icon(Icons.access_alarm),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 60),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // Button background color
                foregroundColor: Colors.white, // Text color
                minimumSize: Size.fromHeight(50), // Set the desired height
              ),
              child: Text(
                'Save',
                style: context.textTheme.bodyLarge!.copyWith(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
