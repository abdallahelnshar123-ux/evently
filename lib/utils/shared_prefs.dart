import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsKeys {
  static const String appThemeKey = 'app_theme';
}

void saveAppTheme(int newAppTheme) async {
  /// dark = 1
  /// light = 2
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  int oldAppTheme = prefs.getInt(SharedPrefsKeys.appThemeKey) ?? 1;
  if (oldAppTheme == newAppTheme) return;
  prefs.setInt(SharedPrefsKeys.appThemeKey, newAppTheme);
}
