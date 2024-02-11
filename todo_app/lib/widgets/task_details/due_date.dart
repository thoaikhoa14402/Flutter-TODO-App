import 'package:flutter/material.dart';
import 'package:todo_app/utils/extensions.dart';

class DueDate extends StatelessWidget {
  const DueDate({super.key, required this.time, required this.date});

  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(style: DefaultTextStyle.of(context).style, children: [
        TextSpan(
          text: 'Due date: ',
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        TextSpan(
          text: '$date - $time',
          style: context.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w400,
          ),
        ),
      ]),
    );
  }
}
