import 'package:easy_localization/easy_localization.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class TabWidget extends StatelessWidget {
  bool isSelected;
  String eventName;
  IconData icon;

  List<IconData> selectedIcons = [
    AntDesign.windows_fill,
    Clarity.bicycle_solid,
    Icons.cake,
    Icons.group,
    Icons.videogame_asset_rounded,
    Icons.group_work,
    Clarity.book_solid,
    Clarity.image_gallery_solid,
    Clarity.on_holiday_solid,
    Icons.fastfood,
  ];

  List<IconData> unSelectedIcons = [
    AntDesign.windows_outline,
    Clarity.bicycle_line,
    Icons.cake_outlined,
    Icons.group_outlined,
    Icons.videogame_asset_outlined,
    Icons.group_work_outlined,
    Clarity.book_line,
    Clarity.image_gallery_line,
    Clarity.on_holiday_line,
    Icons.fastfood_outlined,
  ];

  TabWidget({
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
