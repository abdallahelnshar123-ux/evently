import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../provider/app_theme_provider.dart';

class BackButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var themeProviderObject = Provider.of<AppThemeProvider>(context);
    return Center(
      child: GestureDetector(
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: themeProviderObject.isLight()
                  ? AppColors.whiteColor
                  : AppColors.inputsColor,
              borderRadius: BorderRadius.circular(8),
              border: BoxBorder.all(
                width: 1,
                color: themeProviderObject.isLight()
                    ? AppColors.strokeColor
                    : AppColors.strokeDarkColor,
              ),
            ),
            child: SvgPicture.asset(
              AppAssets.arrowBackIcon,
              colorFilter: ColorFilter.mode(
                themeProviderObject.isLight()
                    ? AppColors.mainColor
                    : AppColors.whiteColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
