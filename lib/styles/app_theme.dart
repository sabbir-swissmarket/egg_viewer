import 'package:epg_viewer/styles/app_colors.dart';
import 'package:epg_viewer/styles/app_fonts.dart';
import 'package:epg_viewer/styles/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get appTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: AppFont.appFont,
        textTheme: const TextTheme(
          headlineLarge: AppStyles.headline1,
          headlineMedium: AppStyles.headline3,
          headlineSmall: AppStyles.headline5,
          bodyLarge: AppStyles.bodyLarge,
          bodyMedium: AppStyles.bodyMedium,
          bodySmall: AppStyles.bodySmall,
        ),
      );
}
