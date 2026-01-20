import 'package:easy_localization/easy_localization.dart';
import 'package:evently/on_boarding/widget/custom_elevated_button.dart';
import 'package:evently/on_boarding/widget/switch_button.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:evently/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class OnBoardingScreen1 extends StatefulWidget {
  OnBoardingScreen1({super.key});

  @override
  State<OnBoardingScreen1> createState() => _OnBoardingScreen1State();
}

class _OnBoardingScreen1State extends State<OnBoardingScreen1> {
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
                          setState(() {});
                        },
                        selected: context.locale == Locale('en'),
                        child: builtTextWidget(
                          'english',
                          context.locale == Locale('en'),
                        ),
                      ),
                      SwitchButton(
                        onTap: () {
                          if (context.locale == Locale('ar')) return;
                          context.setLocale(Locale('ar'));

                          setState(() {});
                        },
                        selected: context.locale == Locale('ar'),
                        child: builtTextWidget(
                          'arabic',
                          context.locale == Locale('ar'),
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
                          saveAppTheme(2);

                          /// light = 2
                          setState(() {});
                        },
                        selected: context.isLight,
                        child: builtIconWidget(
                          context.isLight,
                          context.isLight
                              ? AppAssets.sunSelectedIcon
                              : AppAssets.sunUnselectedIcon,
                        ),
                      ),
                      SwitchButton(
                        onTap: () {
                          if (themeProviderObject.appTheme == ThemeMode.dark) {
                            return;
                          }
                          themeProviderObject.changeAppTheme(ThemeMode.dark);
                          saveAppTheme(1);

                          /// dark = 1
                          setState(() {});
                        },
                        selected: !context.isLight,
                        child: builtIconWidget(
                          !context.isLight,
                          context.isLight
                              ? AppAssets.moonUnselectedIcon
                              : AppAssets.moonSelectedIcon,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// start button ==================================================
            CustomElevatedButton(
              text: 'lets_start',
              onPressed: () {
                Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.onBoardingScreen2RouteName,
                );
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget builtTextWidget(String text, bool selected) {
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

  Widget builtIconWidget(bool selected, String icon) {
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
