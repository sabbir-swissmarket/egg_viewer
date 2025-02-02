import 'package:epg_viewer/routes/routes.dart';
import 'package:epg_viewer/screens/splash_screen/view/splash_screen.dart';
import 'package:epg_viewer/styles/app_theme.dart';
import 'package:epg_viewer/utils/app_constant.dart';
import 'package:epg_viewer/utils/core.dart';
import 'package:epg_viewer/utils/global_keys.dart';
import 'package:flutter/material.dart';

class EpgViewerApp extends ConsumerWidget {
  const EpgViewerApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstant.appTitle,
          navigatorKey: navigatorKey,
          routes: routes,
          theme: AppTheme.appTheme,
          home: const SplashScreen(),
        );
      },
    );
  }
}
