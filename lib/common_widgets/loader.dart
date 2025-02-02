import 'dart:io';

import 'package:epg_viewer/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final double? width;
  final Color? color;
  const Loader({super.key, this.width, this.color});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoActivityIndicator(
            color: color ?? AppColors.whiteColor,
          )
        : CircularProgressIndicator(
            strokeWidth: width ?? 2,
            color: color ?? AppColors.whiteColor,
          );
  }
}
