import 'package:flutter/material.dart';
import 'package:todo_app/utils/extensions.dart';

class DueDate extends StatelessWidget {
  const DueDate({super.key, required this.time, required this.date});

  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Due date: ',
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '${date} - ${time}',
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
