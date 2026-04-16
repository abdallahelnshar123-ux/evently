import 'package:cached_network_image/cached_network_image.dart';
import 'package:evently/home_screen/tabs/profile_tab/widget/language_widget.dart';
import 'package:evently/home_screen/tabs/profile_tab/widget/profile_item_widget.dart';
import 'package:evently/home_screen/tabs/profile_tab/widget/switch_widget.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var eventsProvider = Provider.of<EventsProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(context.height * 0.019),
          child: Column(
            spacing: context.height * 0.019,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: context.height * 0.030),

              GestureDetector(
                onTap: () {
                  try {
                    userProvider.changeUserAvatar();
                  } catch (e) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(e.toString())));
                  }
                },
                child: Center(
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(200),
                    ),
                    width: context.width / 3,
                    height: context.width / 3,

                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: userProvider.currentUser?.image ?? '',
                      errorWidget: (context, url, error) =>
                          Image.asset(AppAssets.fallbackUserImage),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                              color: AppColors.mainColor,
                            ),
                          ),
                    ),
                  ),
                ),
              ),
              Text(
                userProvider.currentUser!.name,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              Text(
                userProvider.currentUser!.email,
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
                  onPressed: () async {
                    await FirebaseAuth.instance.signOut();
                    eventsProvider.emptyLists();
                    if (!context.mounted) return;
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.loginRouteName,
                      (route) => false,
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
