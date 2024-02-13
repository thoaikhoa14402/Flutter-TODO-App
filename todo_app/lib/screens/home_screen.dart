import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app/config/routes/route_location.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/providers/task/task_provider.dart';
import 'package:todo_app/providers/task_detail_notifier_provider.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/my_app_bar.dart';
import 'package:todo_app/widgets/task_details/task_details.dart';
import 'package:todo_app/widgets/todo_tab_bar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) =>
      HomeScreen(taskId: state.pathParameters['task_id']);
  const HomeScreen({super.key, this.taskId});

  final String? taskId;

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Task> getAllTask() {
    return ref.read(taskProvider).tasks;
  }

  void showDetailsScreenFromNotification() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // help to run this callback function after the frame of widget was rendered by flutter. Because flutter can not both update state and render UI at the same time
      final didOpenModalBottomSheet = ref.watch(modalBottomSheetOpenProvider);
      final allTasks = ref.watch(taskProvider).tasks;
      if (allTasks.isNotEmpty && didOpenModalBottomSheet) {
        final displayedTask =
            allTasks.firstWhere((t) => t.id == int.parse(widget.taskId!));
        await showModalBottomSheet(
          context: context,
          builder: (ctx) {
            return TaskDetails(task: displayedTask);
          },
        );
        ref.read(modalBottomSheetOpenProvider.notifier).state = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    showDetailsScreenFromNotification(); // execute when user taps on the notification based on due date of task
    return Scaffold(
      appBar: const MyAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              'My Tasks',
              style: context.textTheme.headlineSmall!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
          const TodoTabBarView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        onPressed: () {
          context.push(RouteLocation.createTask);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
    );
  }
}
