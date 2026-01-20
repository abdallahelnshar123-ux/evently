import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatelessWidget {
  Widget child;
  VoidCallback onTap;
  bool selected;

  SwitchButton({
    required this.child,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        elevation: 0,
        backgroundColor: selected
            ? context.isLight
                  ? AppColors.mainColor
                  : AppColors.mainDarkModeColor
            : context.isLight
            ? AppColors.whiteColor
            : AppColors.inputsColor,
        side: BorderSide(
          color: selected
              ? AppColors.transparentColor
              : context.isLight
              ? AppColors.strokeColor
              : AppColors.strokeDarkColor,
        ),
      ),
      child: child,
    );
  }
}
