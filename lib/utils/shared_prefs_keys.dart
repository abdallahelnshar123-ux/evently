

class SharedPrefsKeys {
  static const String appThemeKey = 'app_theme';
  static const String onBoardingKey = 'on_boarding';
  static const String userKey = 'user_data';
  static const String tokenKey = 'token';
}

// void saveAppTheme(int newAppTheme) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   int oldAppTheme = prefs.getInt(SharedPrefsKeys.appThemeKey) ?? 1;
//   if (oldAppTheme == newAppTheme) return;
//   prefs.setInt(SharedPrefsKeys.appThemeKey, newAppTheme);
// }
