import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../provider/app_theme_provider.dart';
import '../../utils/app_colors.dart';

class SkipButtonWidget extends StatelessWidget {
  VoidCallback onPressed;

  SkipButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(0),
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
      child: Text(
        context.tr('skip'),
        style: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}

/*

GestureDetector(
      child: Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: context.isLight ? AppColors.whiteColor : AppColors.inputsColor,
          borderRadius: BorderRadius.circular(8),
          border: BoxBorder.all(
            width: 1,
            color: context.isLight
                ? AppColors.strokeColor
                : AppColors.strokeDarkColor,
          ),
        ),
        child: Text(context.tr('skip'), style: Theme.of(context).textTheme.labelMedium,),
      ),
    )
 */