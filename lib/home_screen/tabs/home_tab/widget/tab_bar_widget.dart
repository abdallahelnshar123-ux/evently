import 'package:easy_localization/easy_localization.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  bool isSelected;
  String eventName;
  IconData icon;

  TabBarWidget({
    super.key,
    required this.isSelected,
    required this.eventName,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: context.height * 0.009,
        horizontal: context.width * 0.04,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isSelected
            ? context.isLight
                  ? AppColors.mainColor
                  : AppColors.mainDarkModeColor
            : context.isLight
            ? AppColors.whiteColor
            : AppColors.inputsColor,
        border: Border.all(
          color: isSelected
              ? AppColors.transparentColor
              : context.isLight
              ? AppColors.strokeColor
              : AppColors.strokeDarkColor,
        ),
      ),
      child: Row(
        spacing: 10,
        children: [
          Icon(
            icon,
            size: 24,
            color: isSelected
                ? AppColors.whiteColor
                : context.isLight
                ? AppColors.mainColor
                : AppColors.mainDarkModeColor,
          ),
          Text(
            context.tr(eventName),
            style: isSelected
                ? AppStyles.medium16white
                : Theme.of(context).textTheme.labelLarge,
          ),
        ],
      ),
    );
  }
}
