import 'package:easy_localization/easy_localization.dart';
import 'package:evently/home_screen/home_screen.dart';
import 'package:evently/on_boarding/screen/screen_1.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    ChangeNotifierProvider(
      create: (context) => AppThemeProvider(),
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
