import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/utils/task_categories.dart';
import 'package:todo_app/widgets/list_of_tasks.dart';

class TodoTabBarView extends StatelessWidget {
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
  Widget build(BuildContext context) {
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


// example
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   // Dummy list of task items
//   List<String> allTasks = ['Task 1', 'Task 2', 'Task 3', 'Task 4', 'Task 5'];
//   List<String> todayTasks = ['Task 2', 'Task 4'];
//   List<String> upcomingTasks = ['Task 3', 'Task 5'];

//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Todo List'),
//         bottom: TabBar(
//           controller: _tabController,
//           tabs: [
//             Tab(text: 'All'),
//             Tab(text: 'Today'),
//             Tab(text: 'Upcoming'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           // Content for "All" tab
//           ListView.builder(
//             itemCount: allTasks.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(allTasks[index]),
//               );
//             },
//           ),

//           // Content for "Today" tab
//           ListView.builder(
//             itemCount: todayTasks.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(todayTasks[index]),
//               );
//             },
//           ),

//           // Content for "Upcoming" tab
//           ListView.builder(
//             itemCount: upcomingTasks.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(upcomingTasks[index]),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

