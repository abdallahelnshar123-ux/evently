import 'dart:convert';

import 'package:evently/model/my_user.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/shared_prefs_keys.dart';
import 'package:evently/utils/shared_prefs_utils.dart';

class LocalStorage {
  // SharedPreferences prefs = await SharedPreferences.getInstance() ;

  // ---- FLAGS ----
  // bool get onboardingDone => prefs.getBool('onboarding') ?? false;
  bool get onboarding =>
      SharedPrefsUtils.getData<bool>(key: SharedPrefsKeys.onBoardingKey) ??
      false;

  // Future<void> setOnboardingDone() =>
  //     prefs.setBool('onboarding', true);
  Future<void> setOnboardingDone() => SharedPrefsUtils.saveData(
    key: SharedPrefsKeys.onBoardingKey,
    value: true,
  );

  String get appTheme =>
      SharedPrefsUtils.getData<String>(key: SharedPrefsKeys.appThemeKey) ??
      AppThemeProvider.lightThemeKey;

  Future<void> setTheme(String value) =>
      SharedPrefsUtils.saveData(key: SharedPrefsKeys.appThemeKey, value: value);

  // ---- TOKEN ----
  String? get token =>
      SharedPrefsUtils.getData<String>(key: SharedPrefsKeys.tokenKey);

  Future<void> saveToken(String token) =>
      SharedPrefsUtils.saveData(key: SharedPrefsKeys.tokenKey, value: token);

  Future<void> clearToken() =>
      SharedPrefsUtils.removeData(key: SharedPrefsKeys.tokenKey);

  // ---- USER ----
  Future<void> saveUser(MyUser user) async {
    await SharedPrefsUtils.saveData(
      key: SharedPrefsKeys.userKey,
      value: jsonEncode(user.toFirestore()),
    );
  }

  MyUser? getUser() {
    final data = SharedPrefsUtils.getData<String>(key: SharedPrefsKeys.userKey);
    if (data == null) return null;
    return MyUser.fromFirestore(jsonDecode(data.toString()));
  }

  Future<void> clearUser() =>
      SharedPrefsUtils.removeData(key: SharedPrefsKeys.userKey);
}
