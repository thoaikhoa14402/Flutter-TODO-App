import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:todo_app/config/routes/app_routes.dart';
import 'package:todo_app/data/models/task.dart';
import 'package:todo_app/providers/task_detail_notifier_provider.dart';

class NotificationService {
  static FlutterLocalNotificationsPlugin notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // on tap on any notification
  static void onNotificationTap(
      NotificationResponse notificationResponse) async {
    // handle based on payload (eg task id)
    final context = navigationKey.currentContext;
    ProviderScope.containerOf(context!)
        .read(modalBottomSheetOpenProvider.notifier)
        .state = true;
    context.go('/home/${notificationResponse.payload}');
  }

  Future<void> initNotification() async {
    AndroidInitializationSettings initializationSettingsAndroid =
        const AndroidInitializationSettings('flutter_logo');

    var initializationSettingsIOS = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification:
            (int id, String? title, String? body, String? payload) async {});

    var initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onNotificationTap,
    );
  }

  notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails('channelId', 'channelName',
          importance: Importance.max),
      iOS: DarwinNotificationDetails(),
    );
  }

  static Future<void> scheduledNotification({
    int id = 0,
    String? title = 'Task Title',
    String? body = 'Your task is due in 10 minutes',
    required Task task,
    required DateTime scheduledDate,
  }) async {
    tz.initializeTimeZones();
    await notificationsPlugin.zonedSchedule(
      task.id!,
      task.title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      // tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
      const NotificationDetails(
          android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker',
      )),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
      payload: task.id.toString(),
    );
  }
}
