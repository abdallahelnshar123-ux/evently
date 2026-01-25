import 'package:evently/home_screen/tabs/profile_tab/widget/language_widget.dart';
import 'package:evently/home_screen/tabs/profile_tab/widget/profile_item_widget.dart';
import 'package:evently/home_screen/tabs/profile_tab/widget/switch_widget.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(context.height * 0.019),
          child: Column(
            spacing: context.height * 0.019,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: context.height * 0.030),

              CircleAvatar(
                radius: context.width / 5,

                child: Image.asset(AppAssets.profileImage, fit: BoxFit.fill),
              ),
              Text(
                'Abdallah Elnshar',
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                'abdallahelnshar@gmail.com',
                style: Theme.of(context).textTheme.labelSmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.height * 0.030),
              ProfileItemWidget(text: 'dark_mode', itemWidget: SwitchWidget()),
              ProfileItemWidget(text: 'language', itemWidget: LanguageWidget()),
              ProfileItemWidget(
                text: 'logout',
                itemWidget: IconButton(
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.loginRouteName,
                    );
                  },
                  icon: SvgPicture.asset(AppAssets.logoutIcon, width: 30),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
