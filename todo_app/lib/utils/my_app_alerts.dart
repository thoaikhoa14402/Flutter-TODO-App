import 'package:flutter/material.dart';
import 'package:todo_app/utils/extensions.dart';

class MyAppAlerts {
  const MyAppAlerts._();

  static showMySnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyLarge!.copyWith(
            color: context.colorScheme.surface,
          ),
        ),
        backgroundColor: context.colorScheme.onSurface,
      ),
    );
  }
}
