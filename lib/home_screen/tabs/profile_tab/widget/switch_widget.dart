import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProviderObject = Provider.of<AppThemeProvider>(context);
    return SwitchTheme(
      data: SwitchThemeData(
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Switch(
        padding: EdgeInsets.all(0),
        activeThumbColor: AppColors.whiteColor,
        activeTrackColor: AppColors.mainDarkModeColor,
        inactiveThumbColor: AppColors.whiteColor,
        inactiveTrackColor: AppColors.grayColor,
        trackOutlineColor: WidgetStatePropertyAll(AppColors.transparentColor),
        value: !context.isLight,
        onChanged: (newValue) {
          themeProviderObject.changeAppTheme(
            newValue ? ThemeMode.dark : ThemeMode.light,
          );
          saveAppTheme(newValue ? 1 : 2);

          /// dark = 1    , light = 2
        },
      ),
    );
  }
}
