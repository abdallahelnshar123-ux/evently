import 'package:easy_localization/easy_localization.dart';
import 'package:evently/on_boarding/widget/custom_elevated_button.dart';
import 'package:evently/on_boarding/widget/switch_button.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../utils/app_styles.dart';
import '../../utils/local_storage.dart';

class OnBoardingScreen1 extends StatelessWidget {
  const OnBoardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProviderObject = Provider.of<AppThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          context.isLight
              ? AppAssets.eventlyLogoLight
              : AppAssets.eventlyLogoDark,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// image =======================================================
            Image.asset(
              context.isLight
                  ? AppAssets.onBoarding1Light
                  : AppAssets.onBoarding1Dark,
              fit: BoxFit.cover,
              width: double.infinity,
            ),

            /// title ========================================================
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                context.tr('personalize_your_experience'),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),

            /// description ==================================================
            Text(
              context.tr('on_boarding1_description'),
              style: Theme.of(context).textTheme.bodySmall,
            ),

            /// language selector ============================================
            Padding(
              padding: EdgeInsets.only(
                top: context.height * 0.019,
                bottom: context.height * 0.019,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr('language'),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      SwitchButton(
                        onTap: () {
                          if (context.locale == Locale('en')) return;
                          context.setLocale(Locale('en'));
                        },
                        selected: context.locale == Locale('en'),
                        child: builtTextWidget(
                          'english',
                          context.locale == Locale('en'),
                          context,
                        ),
                      ),
                      SwitchButton(
                        onTap: () {
                          if (context.locale == Locale('ar')) return;
                          context.setLocale(Locale('ar'));
                        },
                        selected: context.locale == Locale('ar'),
                        child: builtTextWidget(
                          'arabic',
                          context.locale == Locale('ar'),
                          context,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// theme selector ===============================================
            Padding(
              padding: EdgeInsets.only(bottom: context.height * 0.019),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    context.tr('theme'),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      SwitchButton(
                        onTap: () {
                          if (themeProviderObject.appTheme == ThemeMode.light) {
                            return;
                          }
                          themeProviderObject.changeAppTheme(ThemeMode.light);
                          LocalStorage.instance.setTheme(
                            AppThemeProvider.lightThemeKey,
                          );
                        },
                        selected: context.isLight,
                        child: builtIconWidget(
                          context.isLight,
                          context.isLight
                              ? AppAssets.sunSelectedIcon
                              : AppAssets.sunUnselectedIcon,
                          context,
                        ),
                      ),
                      SwitchButton(
                        onTap: () {
                          if (themeProviderObject.appTheme == ThemeMode.dark) {
                            return;
                          }
                          themeProviderObject.changeAppTheme(ThemeMode.dark);
                          LocalStorage.instance.setTheme(
                            AppThemeProvider.darkThemeKey,
                          );
                        },
                        selected: !context.isLight,
                        child: builtIconWidget(
                          !context.isLight,
                          context.isLight
                              ? AppAssets.moonUnselectedIcon
                              : AppAssets.moonSelectedIcon,
                          context,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// start button ==================================================
            CustomElevatedButton(
              backgroundColor: context.isLight
                  ? AppColors.mainColor
                  : AppColors.mainDarkModeColor,
              child: Text(
                context.tr('lets_start'),
                style: AppStyles.sBold20White,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.onBoardingScreen2RouteName,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget builtTextWidget(String text, bool selected, BuildContext context) {
    return Text(
      context.tr(text),
      style: context.isLight
          ? selected
                ? Theme.of(
                    context,
                  ).textTheme.labelMedium!.copyWith(color: AppColors.whiteColor)
                : Theme.of(context).textTheme.labelMedium
          : Theme.of(
              context,
            ).textTheme.labelMedium!.copyWith(color: AppColors.whiteColor),
    );
  }

  Widget builtIconWidget(bool selected, String icon, BuildContext context) {
    return SvgPicture.asset(
      icon,
      colorFilter: ColorFilter.mode(
        context.isLight
            ? selected
                  ? AppColors.whiteColor
                  : AppColors.mainColor
            : selected
            ? AppColors.whiteColor
            : AppColors.whiteColor,
        BlendMode.srcIn,
      ),
    );
  }
}
