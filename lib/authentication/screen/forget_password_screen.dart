import 'package:easy_localization/easy_localization.dart';
import 'package:evently/on_boarding/widget/back_button_widget.dart';
import 'package:flutter/material.dart';

import '../../on_boarding/widget/custom_elevated_button.dart';
import '../../provider/app_theme_provider.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';
import '../../utils/screen_size.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.tr('forget_password'),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: context.isLight
                ? AppColors.mainTextColor
                : AppColors.whiteColor,
          ),
        ),
        centerTitle: true,
        leadingWidth: 70,
        leading: BackButtonWidget(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.width * 0.04),
        child: Column(
          spacing: context.height * 0.06,
          children: [
            Image.asset(
              context.isLight
                  ? AppAssets.forgetPasswordLightImage
                  : AppAssets.forgetPasswordDarkImage,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
            CustomElevatedButton(
              backgroundColor: context.isLight
                  ? AppColors.mainColor
                  : AppColors.mainDarkModeColor,
              child: Text(
                context.tr('reset_password'),
                style: AppStyles.sBold20White,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
