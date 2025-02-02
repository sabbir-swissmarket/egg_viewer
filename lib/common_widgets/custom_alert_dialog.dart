import 'dart:ui';
import 'package:epg_viewer/styles/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
    this.backgroungColor = AppColors.scaffoldBgColor,
    this.borderRadius = 30,
    this.content,
    this.title,
    this.alignment,
    this.contentPadding = const EdgeInsets.all(20),
  });
  final Color? backgroungColor;
  final double? borderRadius;
  final Widget? content;
  final Widget? title;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? contentPadding;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
      child: AlertDialog(
        elevation: 0,
        alignment: alignment,
        backgroundColor: backgroungColor,
        insetPadding: const EdgeInsets.all(15),
        contentPadding: contentPadding,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius!)),
        content: content,
        title: title,
      ),
    );
  }
}
