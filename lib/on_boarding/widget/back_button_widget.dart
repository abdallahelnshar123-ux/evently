import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';

import '../../provider/app_theme_provider.dart';

class BackButtonWidget extends StatelessWidget {
  VoidCallback onPressed;

  BackButtonWidget({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(context.height * 0.017),
        child: AspectRatio(
          aspectRatio: 1,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsetsDirectional.fromSTEB(9, 0, 0, 0),
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
              IconData(
                Icons.arrow_back_ios.codePoint,
                matchTextDirection: true,
                fontFamily: Icons.arrow_forward_ios.fontFamily,
              ),
              color: context.isLight
                  ? AppColors.mainDarkModeColor
                  : AppColors.whiteColor,
            ),
          ),
        ),
      ),
    );
  }
}
