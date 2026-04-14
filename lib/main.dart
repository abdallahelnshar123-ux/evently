import 'package:easy_localization/easy_localization.dart';
import 'package:evently/add_event/add_event.dart';
import 'package:evently/authentication/screen/forget_password_screen.dart';
import 'package:evently/edit_event/edit_event.dart';
import 'package:evently/event_details/event_details.dart';
import 'package:evently/home_screen/home_screen.dart';
import 'package:evently/model/my_user.dart';
import 'package:evently/on_boarding/screen/screen_1.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:evently/utils/local_storage.dart';
import 'package:evently/utils/shared_prefs_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'authentication/screen/login_screen.dart';
import 'authentication/screen/signup_screen.dart';
import 'firebase_options.dart';
import 'on_boarding/screen/screen_2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SharedPrefsUtils.init();

  final LocalStorage localStorage = LocalStorage();
  final String appTheme = localStorage.appTheme;
  final bool showIntro = localStorage.onboarding;
  final MyUser? user = localStorage.getUser();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppThemeProvider(
            appTheme: appTheme == AppThemeProvider.darkThemeKey
                ? ThemeMode.dark
                : ThemeMode.light,
          ),
        ),
        ChangeNotifierProvider(create: (context) => EventsProvider()),
        ChangeNotifierProvider(
          create: (context) => UserProvider()..initUser(user),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: [Locale('en'), Locale('ar')],
        path: 'assets/translations',
        startLocale: Locale('en'),
        saveLocale: true,
        child: MyApp(showIntro: showIntro, user: user),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool showIntro;
  final MyUser? user;

  const MyApp({super.key, required this.showIntro, required this.user});

  @override
  Widget build(BuildContext context) {
    var themeProviderObject = Provider.of<AppThemeProvider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: showIntro
          ? AppRoutes.onBoardingScreen1RouteName
          : user == null
          ? AppRoutes.loginRouteName
          : AppRoutes.homeRouteName,
      routes: {
        AppRoutes.homeRouteName: (context) => HomeScreen(),
        AppRoutes.onBoardingScreen1RouteName: (context) => OnBoardingScreen1(),
        AppRoutes.onBoardingScreen2RouteName: (context) => OnBoardingScreen2(),
        AppRoutes.loginRouteName: (context) => LoginScreen(),
        AppRoutes.signupRouteName: (context) => SignupScreen(),
        AppRoutes.forgetPasswordRouteName: (context) => ForgetPasswordScreen(),
        AppRoutes.addEventRouteName: (context) => AddEventScreen(),
        AppRoutes.editEventRouteName: (context) => EditEventScreen(),
        AppRoutes.eventDetailsRouteName: (context) => EventDetailsScreen(),
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
