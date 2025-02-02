import 'dart:io';

import 'package:epg_viewer/locator/locator.dart';
import 'package:epg_viewer/models/program_model/program_model.dart';
import 'package:epg_viewer/utils/core.dart';
import 'package:epg_viewer/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationServices {
  late final FlutterLocalNotificationsPlugin flutterNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _androidChannel =
      AndroidNotificationChannel(
    'channel ID',
    'channel name',
    playSound: true,
    importance: Importance.max,
  );

  static const AndroidNotificationDetails _androidDetails =
      AndroidNotificationDetails(
    'epg_reminders',
    'EPG Reminders',
    importance: Importance.max,
    priority: Priority.max,
  );

  static const NotificationDetails _platformDetails =
      NotificationDetails(android: _androidDetails);

  Future<void> initNotification() async {
    if (!await _isNotificationPluginInitialized()) {
      const AndroidInitializationSettings androidSettings =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      const DarwinInitializationSettings iosSettings =
          DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );
      InitializationSettings initializationSettings =
          const InitializationSettings(
              android: androidSettings, iOS: iosSettings);
      await flutterNotificationPlugin.initialize(initializationSettings);
      await flutterNotificationPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(_androidChannel);
    }
  }

  Future<bool> _isNotificationPluginInitialized() async {
    final settings =
        await flutterNotificationPlugin.getNotificationAppLaunchDetails();
    return settings?.didNotificationLaunchApp ?? false;
  }

  Future<void> scheduleNotification(ProgramModel program) async {
    try {
      final utils = locator.get<Utils>();
      final startTime = utils.convertToUTC(program.startTime).toString();
      final location = tz.getLocation('Europe/Zagreb');
      final scheduledTime = tz.TZDateTime.parse(location, startTime);
      await flutterNotificationPlugin
          .zonedSchedule(
        program.hashCode,
        'Program Reminder',
        '${program.title} starts at ${utils.getFormattedTime(DateTime.parse(startTime))}',
        scheduledTime,
        _platformDetails,
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      )
          .then((value) {
        locator
            .get<Utils>()
            .showToast("Reminder has been set!", false, Platform.isIOS);
      });
    } catch (e) {
      debugPrint("Error scheduling notification: $e");
    }
  }
}
