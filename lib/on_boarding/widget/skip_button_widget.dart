import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../provider/app_theme_provider.dart';
import '../../utils/app_colors.dart';

class SkipButtonWidget extends StatelessWidget {
  const SkipButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
        child: Text(context.tr('skip')),
      ),
    );
  }
}
