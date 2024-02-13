import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/app/todo_app.dart';
import 'package:todo_app/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(
    const ProviderScope(
      child: TodoApp(),
    ),
  );
}
