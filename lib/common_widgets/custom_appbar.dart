import 'package:epg_viewer/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    required this.height,
    required this.isIOS,
    required this.title,
    this.centerTitle = false,
    this.backgroundColor = AppColors.scaffoldBgColor,
    this.textColor,
    this.iconColor = AppColors.whiteColor,
    this.showLeadingIcon,
    this.systemOverlayStyle,
    this.onPressedBackButton,
  });
  final double height;
  final bool? centerTitle;
  final bool isIOS;
  final String title;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? iconColor;
  final bool? showLeadingIcon;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Function()? onPressedBackButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: backgroundColor,
      centerTitle: centerTitle,
      scrolledUnderElevation: 0,
      leading: showLeadingIcon == null || showLeadingIcon == true
          ? IconButton(
              onPressed: onPressedBackButton ??
                  () {
                    Navigator.pop(context);
                  },
              icon: isIOS
                  ? const Icon(
                      Icons.arrow_back_ios_new,
                    )
                  : const Icon(
                      Icons.keyboard_backspace_outlined,
                    ),
            )
          : null,
      title: Text(title),
      titleTextStyle: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color:
                textColor ?? Theme.of(context).textTheme.headlineMedium!.color,
          ),
      iconTheme: IconThemeData(color: iconColor, size: 24),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
