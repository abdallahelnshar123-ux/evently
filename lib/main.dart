import 'package:evently/home_screen/home_screen.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRouteName,
      routes: { AppRoutes.homeRouteName : (context) => HomeScreen(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme ,
      themeMode: ThemeMode.system ,
    );
  }
}

