import 'package:easy_localization/easy_localization.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class DateTimeWidget extends StatelessWidget {
  IconData icon;
  String labelText;
  String hyperText;
  VoidCallback onPressed;

  DateTimeWidget.date({
    super.key,
    this.icon = Iconsax.calendar_add_outline,
    this.labelText = 'event_date',
    required this.hyperText,
    required this.onPressed
  });

  DateTimeWidget.time({
    super.key,
    this.icon = Bootstrap.clock,
    this.labelText = 'event_time',
    required this.hyperText,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        Icon(
          icon,
          size: 24,
          color: context.isLight
              ? AppColors.mainColor
              : AppColors.mainDarkModeColor,
        ),
        Text(
          context.tr(labelText),
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            hyperText,
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: context.isLight
                  ? AppColors.mainColor
                  : AppColors.mainDarkModeColor,
            ),
          ),
        ),
      ],
    );
  }
}
