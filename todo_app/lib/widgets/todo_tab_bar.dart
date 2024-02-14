import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/providers/task/task_provider.dart';
import 'package:todo_app/utils/helpers.dart';
import 'package:todo_app/utils/task_filter.dart';
import 'package:todo_app/widgets/list_of_tasks.dart';

class TodoTabBarView extends ConsumerWidget {
  const TodoTabBarView({super.key});

  static List<Tab> myTabs = <Tab>[
    Tab(
      child: Text(
        'All',
        style: GoogleFonts.montserrat(
          fontSize: 17,
        ),
      ),
    ),
    Tab(
      child: Text(
        'Today',
        style: GoogleFonts.montserrat(
          fontSize: 17,
        ),
      ),
    ),
    Tab(
      child: Text(
        'Upcoming',
        style: GoogleFonts.montserrat(
          fontSize: 17,
        ),
      ),
    ),
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
          TabBar(
            tabs: myTabs,
            unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal, // Normal for unselected tabs
            ),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w800, // Normal for unselected tabs
            ),
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
