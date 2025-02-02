import 'package:epg_viewer/epg_viewer_app.dart';
import 'package:epg_viewer/locator/locator.dart';
import 'package:epg_viewer/services/notification_services.dart';
import 'package:epg_viewer/utils/core.dart';
import 'package:flutter/material.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  setupLocator();
  await locator.get<NotificationServices>().initNotification();
  runApp(const ProviderScope(child: EpgViewerApp()));
}
