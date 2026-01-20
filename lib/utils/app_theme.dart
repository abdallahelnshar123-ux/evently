import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      labelMedium: AppStyles.sBold14Main,

      /// 14s bold main
      titleMedium: AppStyles.sBold20MainText,

      /// 20 s bold main text
      titleSmall: AppStyles.medium18Main,

      /// 18  medium main
      bodySmall: AppStyles.regular16SexText,

      /// 16 regular sec text
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.whiteColor,
      selectedIconTheme: IconThemeData(color: AppColors.mainColor),
      unselectedIconTheme: IconThemeData(color: AppColors.disableColor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainColor,
      shape: StadiumBorder(),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundColor,
      toolbarHeight: 80,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(
      labelMedium: AppStyles.sBold14White,

      /// 14s bold white
      titleMedium: AppStyles.sBold20White,

      /// 20 s bold white
      titleSmall: AppStyles.medium18white,

      /// 18  medium white
      bodySmall: AppStyles.regular16SexTextDark,

      /// 16 regular sec text
    ),
    scaffoldBackgroundColor: AppColors.bgDarkModeColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.bgDarkModeColor,
      selectedIconTheme: IconThemeData(color: AppColors.mainDarkModeColor),
      unselectedIconTheme: IconThemeData(color: AppColors.disableColor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColors.mainDarkModeColor,
      shape: StadiumBorder(),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bgDarkModeColor,
      toolbarHeight: 80,
    ),
  );
}
