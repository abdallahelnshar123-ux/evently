import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
    ),
    dividerTheme: DividerThemeData(color: AppColors.strokeColor, thickness: 1),
    popupMenuTheme: PopupMenuThemeData(color: AppColors.mainDarkModeColor),
    textTheme: TextTheme(
      titleLarge: AppStyles.sBold24Main,

      /// 24 s bold main
      labelLarge: AppStyles.medium16MainText,

      /// 16 medium main text
      labelSmall: AppStyles.regular14sexText,

      /// 14 regular sex text
      labelMedium: AppStyles.sBold14Main,

      /// 14s bold main
      titleMedium: AppStyles.sBold20MainText,

      /// 20 s bold main text
      titleSmall: AppStyles.medium18Main,

      /// 18  medium main
      bodySmall: AppStyles.regular16SexText,

      /// 16 regular sec text
      displaySmall: AppStyles.sBold14Main,

      /// 14 s bold main
      headlineMedium: AppStyles.medium20MainText,

      /// 20 medium main text
    ),
    scaffoldBackgroundColor: AppColors.backgroundColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedLabelStyle: AppStyles.regular12Main,
      selectedItemColor: AppColors.mainColor,
      unselectedItemColor: AppColors.disableColor,
      unselectedLabelStyle: AppStyles.regular12Disable,
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
      leadingWidth: 70,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(tapTargetSize: MaterialTapTargetSize.shrinkWrap),
    ),
    dividerTheme: DividerThemeData(
      color: AppColors.strokeDarkColor,
      thickness: 1,
    ),
    popupMenuTheme: PopupMenuThemeData(color: AppColors.mainDarkModeColor),
    textTheme: TextTheme(
      titleLarge: AppStyles.sBold24White,

      /// 24 s bold white
      labelLarge: AppStyles.medium16white,

      /// 16 medium white
      labelSmall: AppStyles.regular14sexTextDark,

      /// 14 regular sex text dark
      labelMedium: AppStyles.sBold14White,

      /// 14s bold white
      titleMedium: AppStyles.sBold20White,

      /// 20 s bold white
      titleSmall: AppStyles.medium18white,

      /// 18  medium white
      bodySmall: AppStyles.regular16SexTextDark,

      /// 16 regular sec text
      displaySmall: AppStyles.sBold14MainDark,

      /// 14 s bold main dark
      headlineMedium: AppStyles.medium20White,

      /// 20 medium white
    ),
    scaffoldBackgroundColor: AppColors.bgDarkModeColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedLabelStyle: AppStyles.regular12Disable,
      selectedItemColor: AppColors.mainDarkModeColor,
      unselectedItemColor: AppColors.disableColor,
      selectedLabelStyle: AppStyles.regular12MainDark,
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
      leadingWidth: 70,
    ),
  );
}
