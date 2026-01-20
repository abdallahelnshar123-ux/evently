import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app_theme_provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  double appBarHeight = 80;

  CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var appTheme = Provider.of<AppThemeProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.width * 0.04),
      child: AppBar(
        toolbarHeight: appBarHeight,
        title: Image.asset(
          appTheme.isLight()
              ? AppAssets.eventlyLogoLight
              : AppAssets.eventlyLogoDark,
        ),
        centerTitle: true,

        leadingWidth: context.width * 0.085,
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBarHeight);
}
