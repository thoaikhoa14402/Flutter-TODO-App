import 'package:flutter/material.dart';
import 'package:todo_app/screens/home_screen.dart';
import 'package:todo_app/widgets/my_appbar.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        // debugShowCheckedModeBanner: false,
        // theme: AppTheme.light,
        // theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
        home: HomeScreen()
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}
