import 'package:flutter/material.dart';
import 'package:todo_app/utils/extensions.dart';

class TaskDescription extends StatelessWidget {
  const TaskDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Description: ',
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          description,
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
