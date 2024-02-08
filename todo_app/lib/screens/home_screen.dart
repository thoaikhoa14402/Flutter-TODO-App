import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utils/extensions.dart';
import 'package:todo_app/widgets/my_app_bar.dart';
import 'package:todo_app/widgets/search_bar.dart';
import 'package:todo_app/widgets/todo_tab_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
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
              style: GoogleFonts.montserrat(
                textStyle: context.textTheme.headlineSmall!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const TodoTabBarView(),
        ],
      ),
      // body:
    );
  }
}
