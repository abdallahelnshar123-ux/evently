import 'package:easy_localization/easy_localization.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/screen_size.dart';

class ProfileItemWidget extends StatelessWidget {
  final String text;
  final Widget itemWidget;

  const ProfileItemWidget({
    super.key,
    required this.text,
    required this.itemWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 65,
      decoration: BoxDecoration(
        color: context.isLight ? AppColors.whiteColor : AppColors.inputsColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: context.isLight
              ? AppColors.strokeColor
              : AppColors.strokeDarkColor,
          width: 1,
        ),
      ),
      width: double.infinity,
      padding: EdgeInsets.all(context.height * 0.019),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(context.tr(text), style: Theme.of(context).textTheme.labelLarge),
          itemWidget,
        ],
      ),
    );
  }
}
