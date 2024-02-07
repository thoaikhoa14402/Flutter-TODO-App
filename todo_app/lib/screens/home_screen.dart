import 'package:flutter/material.dart';
import 'package:todo_app/widgets/my_appbar.dart';
import 'package:todo_app/widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(),
      body: Column(
        children: [
          SizedBox(height: 24),
          Center(
            child: Text('Home Screen'),
          ),
        ],
      ),
      // body:
    );
  }
}
