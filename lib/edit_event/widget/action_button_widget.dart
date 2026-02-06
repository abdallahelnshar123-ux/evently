import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';

import '../../provider/app_theme_provider.dart';

class ActionButtonWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final Color lightIconColor;
  final IconData icon;

  final Color darkIconColor;

  const ActionButtonWidget({
    required this.icon,
    super.key,
    required this.onPressed,
    required this.darkIconColor,
    required this.lightIconColor,
  });

  const ActionButtonWidget.edit({
    this.icon = Icons.edit,
    super.key,
    this.lightIconColor = AppColors.mainColor,
    this.darkIconColor = AppColors.mainDarkModeColor,
    required this.onPressed,
  });

  const ActionButtonWidget.delete({
    this.icon = Icons.delete_outline_outlined,
    super.key,
    this.lightIconColor = AppColors.redColor,
    this.darkIconColor = AppColors.redColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: context.width * 0.1,
        height: context.width * 0.1,
        decoration: BoxDecoration(
          color: context.isLight ? AppColors.whiteColor : AppColors.inputsColor,
          border: Border.all(
            color: context.isLight
                ? AppColors.strokeColor
                : AppColors.strokeDarkColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          size: 24,
          icon,
          color: context.isLight ? lightIconColor : darkIconColor,
        ),
      ),
    );

    ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,

        padding: EdgeInsetsDirectional.zero,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: context.isLight
                ? AppColors.strokeColor
                : AppColors.strokeDarkColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        backgroundColor: context.isLight
            ? AppColors.whiteColor
            : AppColors.inputsColor,
      ),
      child: Icon(
        size: 24,
        icon,
        color: context.isLight ? lightIconColor : darkIconColor,
      ),
    );
  }
}
