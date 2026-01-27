import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.backgroundColor,
      alignment: Alignment.center,
    ),
    timePickerTheme: TimePickerThemeData(
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: WidgetStateColor.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return AppColors.mainColor;
          }
          return AppColors.whiteColor;
        }),

        activeIndicatorBorder: BorderSide(color: AppColors.mainColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
        ),
      ),
      backgroundColor: AppColors.backgroundColor,
      cancelButtonStyle: TextButton.styleFrom(
        foregroundColor: AppColors.mainColor,
      ),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: AppColors.mainColor,
      ),
      dayPeriodBorderSide: BorderSide(color: AppColors.mainColor),
      dayPeriodColor: AppColors.mainColor,
      dayPeriodTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.whiteColor;
        }
        return AppColors.mainColor;
      }),
      dialBackgroundColor: AppColors.mainColor,
      dialHandColor: AppColors.whiteColor,
      entryModeIconColor: AppColors.mainColor,
      dialTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.mainColor;
        }
        return AppColors.whiteColor;
      }),
      timeSelectorSeparatorColor: WidgetStatePropertyAll(AppColors.mainColor),
      hourMinuteColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.mainColor;
        }
        return AppColors.whiteColor;
      }),
      hourMinuteTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.whiteColor;
        }
        return AppColors.mainColor;
      }),
      hourMinuteShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: WidgetStateColor.resolveWith((state) {
            if (state.contains(WidgetState.selected)) {
              return AppColors.whiteColor;
            }
            return AppColors.mainColor;
          }),
        ),
      ),
    ),

    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.backgroundColor,
      dividerColor: AppColors.mainColor,
      cancelButtonStyle: TextButton.styleFrom(
        foregroundColor: AppColors.mainColor,
      ),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: AppColors.mainColor,
      ),

      headerBackgroundColor: AppColors.mainColor,
      headerForegroundColor: AppColors.whiteColor,
      rangePickerHeaderForegroundColor: AppColors.mainColor,
      subHeaderForegroundColor: AppColors.mainTextColor,
      yearForegroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.mainColor;
        }
        if (state.contains(WidgetState.disabled)) {
          return AppColors.disableColor.withAlpha(99);
        }
        return AppColors.mainColor;
      }),
      yearBackgroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.backgroundColor;
        }
        return AppColors.backgroundColor;
      }),
      dayForegroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.whiteColor;
        }
        if (state.contains(WidgetState.disabled)) {
          return AppColors.disableColor.withAlpha(99);
        }
        return AppColors.mainColor;
      }),
      dayBackgroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.mainColor;
        }
        return AppColors.backgroundColor;
      }),
      todayBackgroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.mainColor;
        }
        return AppColors.backgroundColor;
      }),
      todayForegroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.whiteColor;
        }
        return AppColors.mainColor;
      }),
      weekdayStyle: AppStyles.medium16MainText,
      inputDecorationTheme: InputDecorationThemeData(
        activeIndicatorBorder: BorderSide(color: AppColors.mainColor),
        labelStyle: TextStyle(color: AppColors.mainColor),
        hintStyle: TextStyle(color: AppColors.disableColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainColor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
        ),
      ),
    ),
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
      bodyLarge: AppStyles.medium20MainText,

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

  /// =======================================================================
  static final ThemeData darkTheme = ThemeData(
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.bgDarkModeColor,
      alignment: Alignment.center,
    ),
    timePickerTheme: TimePickerThemeData(
      inputDecorationTheme: InputDecorationThemeData(
        filled: true,
        fillColor: WidgetStateColor.resolveWith((state) {
          if (state.contains(WidgetState.selected)) {
            return AppColors.mainDarkModeColor;
          }
          return AppColors.whiteColor;
        }),

        activeIndicatorBorder: BorderSide(color: AppColors.mainDarkModeColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainDarkModeColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainDarkModeColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainDarkModeColor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
        ),
      ),
      backgroundColor: AppColors.bgDarkModeColor,
      cancelButtonStyle: TextButton.styleFrom(
        foregroundColor: AppColors.whiteColor,
      ),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: AppColors.whiteColor,
      ),
      dayPeriodBorderSide: BorderSide(color: AppColors.mainDarkModeColor),
      dayPeriodColor: AppColors.mainDarkModeColor,
      dayPeriodTextColor: AppColors.whiteColor,
      dialBackgroundColor: AppColors.mainDarkModeColor,
      dialHandColor: AppColors.whiteColor,
      entryModeIconColor: AppColors.whiteColor,
      dialTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.mainDarkModeColor;
        }
        return AppColors.whiteColor;
      }),
      timeSelectorSeparatorColor: WidgetStatePropertyAll(
        AppColors.mainDarkModeColor,
      ),
      hourMinuteColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.mainDarkModeColor;
        }
        return AppColors.whiteColor;
      }),
      hourMinuteTextColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.whiteColor;
        }
        return AppColors.mainDarkModeColor;
      }),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.bgDarkModeColor,
      dividerColor: AppColors.whiteColor,
      cancelButtonStyle: TextButton.styleFrom(
        foregroundColor: AppColors.whiteColor,
      ),
      confirmButtonStyle: TextButton.styleFrom(
        foregroundColor: AppColors.whiteColor,
      ),

      headerBackgroundColor: AppColors.mainDarkModeColor,
      headerForegroundColor: AppColors.whiteColor,
      rangePickerHeaderForegroundColor: AppColors.whiteColor,
      subHeaderForegroundColor: AppColors.whiteColor,
      yearForegroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.whiteColor;
        }
        if (state.contains(WidgetState.disabled)) {
          return AppColors.disableColor.withAlpha(99);
        }
        return AppColors.mainDarkModeColor;
      }),
      yearBackgroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.mainDarkModeColor;
        }
        return AppColors.bgDarkModeColor;
      }),
      dayForegroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.whiteColor;
        }
        if (state.contains(WidgetState.disabled)) {
          return AppColors.disableColor.withAlpha(99);
        }
        return AppColors.mainDarkModeColor;
      }),
      dayBackgroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.mainDarkModeColor;
        }
        return AppColors.bgDarkModeColor;
      }),
      todayBackgroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.mainDarkModeColor;
        }
        return AppColors.bgDarkModeColor;
      }),
      todayForegroundColor: WidgetStateColor.resolveWith((state) {
        if (state.contains(WidgetState.selected)) {
          return AppColors.whiteColor;
        }
        return AppColors.mainDarkModeColor;
      }),
      weekdayStyle: AppStyles.medium16white,
      inputDecorationTheme: InputDecorationThemeData(
        activeIndicatorBorder: BorderSide(color: AppColors.mainDarkModeColor),
        labelStyle: TextStyle(color: AppColors.mainDarkModeColor),
        hintStyle: TextStyle(color: AppColors.disableColor),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainDarkModeColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainDarkModeColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.mainDarkModeColor),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.redColor),
        ),
      ),
    ),
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
      bodyLarge: AppStyles.medium20White,

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
