import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(),
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
    appBarTheme: AppBarTheme(backgroundColor: AppColors.backgroundColor),
  );

  static final ThemeData darkTheme = ThemeData(
    textTheme: TextTheme(),
    scaffoldBackgroundColor: AppColors.bgDarkModeColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(

      backgroundColor: AppColors.bgDarkModeColor,
      selectedIconTheme: IconThemeData(color: AppColors.mainDarkModeColor),
      unselectedIconTheme: IconThemeData(color: AppColors.disableColor),
    ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.mainDarkModeColor,
          shape: StadiumBorder()
      ),,
    appBarTheme: AppBarTheme(backgroundColor: AppColors.bgDarkModeColor),
  );
}
