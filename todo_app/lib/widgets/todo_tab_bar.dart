import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/providers/task/task_provider.dart';
import 'package:todo_app/utils/helpers.dart';
import 'package:todo_app/utils/task_categories.dart';
import 'package:todo_app/utils/task_filter.dart';
import 'package:todo_app/widgets/list_of_tasks.dart';

class TodoTabBarView extends ConsumerWidget {
  TodoTabBarView({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'All'),
    Tab(text: 'Today'),
    Tab(text: 'Upcoming'),
  ];

//   // Dummy list of task items
  final List<Task> allTasks = [
    Task(
      title: 'title',
      description: 'description',
      time: '10:12PM',
      date: 'Aug, 07',
      category: TaskCategories.education,
      isCompleted: false,
    ),
    Task(
      title: 'title',
      description: 'description',
      time: '10:14PM',
      date: 'Aug, 07',
      category: TaskCategories.home,
      isCompleted: false,
    ),
    Task(
      title: 'title',
      description: 'description',
      time: '10:14PM',
      date: 'Aug, 07',
      category: TaskCategories.health,
      isCompleted: false,
    ),
    Task(
      title: 'title',
      description: 'description',
      time: '10:14PM',
      date: 'Aug, 07',
      category: TaskCategories.personal,
      isCompleted: false,
    ),
    Task(
      title: 'title',
      description: 'description',
      time: '10:14PM',
      date: 'Aug, 07',
      category: TaskCategories.shopping,
      isCompleted: false,
    ),
    Task(
      title: 'title',
      description: 'description',
      time: '10:14PM',
      date: 'Aug, 07',
      category: TaskCategories.social,
      isCompleted: false,
    ),
    Task(
      title: 'title',
      description: 'description',
      time: '10:14PM',
      date: 'Aug, 07',
      category: TaskCategories.work,
      isCompleted: false,
    ),
    Task(
      title: 'title',
      description: 'description',
      time: '10:14PM',
      date: 'Aug, 07',
      category: TaskCategories.travel,
      isCompleted: false,
    ),
  ];

  final List<Task> todayTasks = [
    Task(
      title: 'title',
      description: 'description',
      time: '10:12PM',
      date: 'Aug, 07',
      category: TaskCategories.education,
      isCompleted: false,
    )
  ];

  final List<Task> upcomingTasks = [
    Task(
      title: 'title',
      description: 'description',
      time: '10:14PM',
      date: 'Aug, 07',
      category: TaskCategories.home,
      isCompleted: false,
    )
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskState = ref.watch(taskProvider);
    final allTasks = taskState.tasks;
    final todayTasks =
        Helpers.filterListTasks(taskState.tasks, TaskFilter.today);
    final upcomingTasks =
        Helpers.filterListTasks(taskState.tasks, TaskFilter.upcoming);
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        children: [
          const TabBar(
            tabs: myTabs,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 480,
            child: TabBarView(
              children: [
                ListOfTasks(tasks: allTasks),
                ListOfTasks(tasks: todayTasks),
                ListOfTasks(tasks: upcomingTasks),
              ],
            ),
          )
        ],
      ),
    );
  }
}
