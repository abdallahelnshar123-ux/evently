import 'package:easy_localization/easy_localization.dart';
import 'package:evently/home_screen/home_screen.dart';
import 'package:evently/on_boarding/screen/screen_1.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:evently/utils/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'on_boarding/screen/screen_2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  final int appTheme =
      sharedPreferences.getInt(SharedPrefsKeys.appThemeKey) ?? 1;

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppThemeProvider(
        appTheme: appTheme == 1 ? ThemeMode.dark : ThemeMode.light,
      ),
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        startLocale: Locale('en'),
        saveLocale: true,
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProviderObject = Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.onBoardingScreen1RouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.onBoardingScreen1RouteName: (context) => OnBoardingScreen1(),
        AppRoutes.onBoardingScreen2RouteName: (context) => OnBoardingScreen2(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProviderObject.appTheme,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
