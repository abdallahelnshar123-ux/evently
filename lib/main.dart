import 'package:easy_localization/easy_localization.dart';
import 'package:evently/add_event/add_event.dart';
import 'package:evently/authentication/screen/forget_password_screen.dart';
import 'package:evently/home_screen/home_screen.dart';
import 'package:evently/on_boarding/screen/screen_1.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:evently/utils/shared_prefs.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'authentication/screen/login_screen.dart';
import 'authentication/screen/signup_screen.dart';
import 'firebase_options.dart';
import 'on_boarding/screen/screen_2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseFirestore.instance.disableNetwork();

  final sharedPreferences = await SharedPreferences.getInstance();
  final int appTheme =
      sharedPreferences.getInt(SharedPrefsKeys.appThemeKey) ?? 1;
  final bool showIntro =
      sharedPreferences.getBool(SharedPrefsKeys.onBoardingKey) ?? true;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppThemeProvider(
            appTheme: appTheme == 1 ? ThemeMode.dark : ThemeMode.light,
          ),
        ),
        ChangeNotifierProvider(create: (context) => EventsProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        startLocale: Locale('en'),
        saveLocale: true,
        child: MyApp(showIntro: showIntro),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool showIntro;

  const MyApp({super.key, required this.showIntro});

  @override
  Widget build(BuildContext context) {
    var themeProviderObject = Provider.of<AppThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.loginRouteName,

      // showIntro
      //     ? AppRoutes.onBoardingScreen1RouteName
      //     : AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.onBoardingScreen1RouteName: (context) => OnBoardingScreen1(),
        AppRoutes.onBoardingScreen2RouteName: (context) => OnBoardingScreen2(),
        AppRoutes.loginRouteName: (context) => LoginScreen(),
        AppRoutes.signupRouteName: (context) => SignupScreen(),
        AppRoutes.forgetPasswordRouteName: (context) => ForgetPasswordScreen(),
        AppRoutes.addEventRouteName: (context) => AddEventScreen(),
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
