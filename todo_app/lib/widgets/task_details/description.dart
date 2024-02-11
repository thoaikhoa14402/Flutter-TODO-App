import 'package:flutter/material.dart';

class TaskDescription extends StatelessWidget {
  const TaskDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: RichText(
          text: TextSpan(
            style: DefaultTextStyle.of(context).style,
            children: [
              const TextSpan(
                text: 'Description: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              TextSpan(
                text: description,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
