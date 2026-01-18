import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/app_theme_provider.dart';

extension ScreenSize on BuildContext {
  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  AppThemeProvider get object => Provider.of<AppThemeProvider>(this);
}
