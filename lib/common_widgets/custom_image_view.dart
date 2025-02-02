import 'package:epg_viewer/common_widgets/loader.dart';
import 'package:epg_viewer/styles/app_colors.dart';
import 'package:epg_viewer/utils/core.dart';
import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final double? loaderHeight;
  final double? loaderWidth;
  final double? radius;
  final BoxBorder? border;
  final Color? progressIndicatorColor;
  final BoxFit? boxfit;
  const CustomImageView({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.loaderHeight,
    this.loaderWidth,
    this.radius,
    this.progressIndicatorColor,
    this.border,
    this.boxfit,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 0)),
          border: border,
          image: DecorationImage(
            image: imageProvider,
            fit: boxfit ?? BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Container(
        padding: const EdgeInsets.all(0),
        height: loaderHeight ?? 40,
        width: loaderWidth ?? 40,
        child: Center(
          child: Loader(
            color: progressIndicatorColor,
          ),
        ),
      ),
      errorWidget: (context, url, error) => Container(
        height: 40,
        width: 40,
        margin: const EdgeInsets.all(0),
        child: const Center(
          child: Icon(
            Icons.report,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
