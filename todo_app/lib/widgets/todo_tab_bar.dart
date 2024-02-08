import 'package:flutter/material.dart';

class TodoTabBarView extends StatelessWidget {
  const TodoTabBarView({super.key});

  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'All'),
    Tab(text: 'Today'),
    Tab(text: 'Upcoming'),
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
            labelStyle: TextStyle(
              fontFamily: 'Montserrat',
            ),
          ),
          Container(
            height: 300, // Adjust the height of TabBarView container as needed
            child: const TabBarView(
              children: [
                // Content for "All" tab
                Center(child: Text('All Todos')),

                // Content for "Today" tab
                Center(child: Text('Today Todos')),

                // Content for "Upcoming" tab
                Center(child: Text('Upcoming Todos')),
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

