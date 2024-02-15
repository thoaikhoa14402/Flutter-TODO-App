import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/routes/route_location.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/providers/category_provider.dart';
import 'package:todo_app/providers/date_provider.dart';
import 'package:todo_app/providers/task/task_provider.dart';
import 'package:todo_app/providers/time_provider.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/utils/helpers.dart';
import 'package:todo_app/utils/my_app_alerts.dart';
import 'package:todo_app/widgets/create_new_task/common_text_field.dart';
import 'package:todo_app/widgets/create_new_task/select_category.dart';
import 'package:todo_app/widgets/create_new_task/select_date_time.dart';

class CreateTaskScreen extends ConsumerStatefulWidget {
  static CreateTaskScreen builder(BuildContext context, GoRouterState state) =>
      const CreateTaskScreen();

  const CreateTaskScreen({super.key});

  @override
  ConsumerState<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends ConsumerState<CreateTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

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
            CommonTextField(
              title: 'Task Title',
              hintText: 'Enter your task title',
              prefixIcon: const Icon(Icons.title),
              controller: _titleController,
            ),
            const SizedBox(height: 24),
            CommonTextField(
              title: 'Task Description',
              hintText: 'Enter your task description',
              maxLines: 8,
              controller: _descriptionController,
            ),
            const SizedBox(height: 24),
            const SelectDateTime(),
            const SizedBox(height: 28),
            const SelectCategory(),
            const SizedBox(height: 80),
            ElevatedButton(
              onPressed: _createTask,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple, // Button background color
                foregroundColor: Colors.white, // Text color
                minimumSize:
                    const Size.fromHeight(50), // Set the desired height
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

  void _createTask() async {
    final title = _titleController.text.trim();
    final description = _descriptionController.text.trim();
    final date = ref.watch(dateProvider);
    final time = ref.watch(timeProvider);
    final category = ref.watch(categoryProvider);

    if (title.isNotEmpty) {
      final task = Task(
        title: title,
        description: description,
        date: Helpers.dateToString(date),
        time: Helpers.timeToString(time),
        category: category,
        isCompleted: false,
      );
      await ref.read(taskProvider.notifier).createTask(task).then((value) {
        Helpers.scheduledNotification(value);
        MyAppAlerts.showMySnackBar(
            context, 'A new task was created successfully!');
        context.go(RouteLocation.home);
      });
    } else {
      MyAppAlerts.showMySnackBar(context, 'Please fill your task title!');
    }
  }
}
