import 'package:epg_viewer/locator/locator.dart';
import 'package:epg_viewer/screens/splash_screen/provider/splash_screen_provider.dart';
import 'package:epg_viewer/utils/core.dart';
import 'package:epg_viewer/utils/screen_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    locator.get<SizeConfig>().init(context);
    ref.watch(splashScreenNotifierProvider);
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/epg_logo.jpg',
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
