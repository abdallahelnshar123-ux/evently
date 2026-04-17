import 'package:easy_localization/easy_localization.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      style: ButtonStyle(alignment: AlignmentDirectional.centerEnd),
      onSelected: (value) {
        if (context.locale.languageCode == value) return;
        context.setLocale(Locale(value));
        Intl.defaultLocale = value;
      },
      iconSize: 28,
      padding: EdgeInsets.zero,
      icon: Icon(
        Icons.arrow_forward_ios,
        size: 24,
        color: context.isLight
            ? AppColors.mainDarkModeColor
            : AppColors.whiteColor,
      ),
      itemBuilder: (BuildContext context) => [
        PopupMenuItem(
          value: 'en',
          child: Text(
            context.tr('english'),
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
          ),
        ),
        PopupMenuItem(
          value: 'ar',
          child: Text(
            context.tr('arabic'),
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
          ),
        ),
      ],
    );
  }
}
