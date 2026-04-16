import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:evently/firebase_utils.dart';
import 'package:evently/home_screen/tabs/profile_tab/widget/language_widget.dart';
import 'package:evently/home_screen/tabs/profile_tab/widget/profile_item_widget.dart';
import 'package:evently/home_screen/tabs/profile_tab/widget/switch_widget.dart';
import 'package:evently/model/my_user.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/cloudinary_service.dart';
import 'package:evently/utils/image_service.dart';
import 'package:evently/utils/local_storage.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  // String? userImageUrl;
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
                onTap: () async {
                  File? image = await ImageService.pickImage();
                  if (image != null) {
                    String? imageUrl = await CloudinaryService.uploadImage(
                      image,
                    );
                    if (imageUrl == null) return;
                    await FirebaseUtils.updateUserImage(
                      userId: userProvider.currentUser?.id ?? '',
                      imageUrl: imageUrl,
                    );
                    LocalStorage localStorage = LocalStorage();
                    MyUser user = MyUser(
                      id: userProvider.currentUser?.id ?? "",
                      email: userProvider.currentUser?.email ?? "",
                      name: userProvider.currentUser?.name ?? "",
                      image: imageUrl,
                    );
                    localStorage.saveUser(user);
                    userProvider.changeUser(user);
                  }
                },
                child:
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(100),
                    //   clipBehavior: Clip.antiAlias,
                    //   child: CachedNetworkImage(
                    //     fit: BoxFit.cover,
                    //     width: 100,
                    //     height:100 ,
                    //     imageUrl: userProvider.currentUser?.image ?? '',
                    //     errorWidget: (context, url, error) =>
                    //         Image.asset(AppAssets.profileImage),
                    //     progressIndicatorBuilder:
                    //         (context, url, downloadProgress) =>
                    //         CircularProgressIndicator(
                    //           value: downloadProgress.progress,
                    //           color: AppColors.mainColor,
                    //         ),
                    //   ),
                    // ),
                    Container(
                      width: 100,
                      height: 100,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(300),
                      ),

                      child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: userProvider.currentUser?.image ?? '',
                    errorWidget: (context, url, error) =>
                        Image.asset(AppAssets.profileImage),
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                        CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: AppColors.mainColor,
                        ),
                  ),
                ),
                // CircleAvatar(
                //
                //   radius: context.width / 6,
                //   child:
                //
                //   // backgroundImage:
                //   //     (userProvider.currentUser?.image != null &&
                //   //         userProvider.currentUser!.image!.isNotEmpty)
                //   //     ? CachedNetworkImageProvider(
                //   //         userProvider.currentUser!.image!,
                //   //
                //   //       )
                //   //     : const AssetImage(AppAssets.profileImage)
                //   //           as ImageProvider,
                //
                //   CachedNetworkImage(
                //
                //     imageUrl: userProvider.currentUser?.image ?? '',
                //     errorWidget: (context, url, error) =>
                //         Image.asset(AppAssets.profileImage),
                //     progressIndicatorBuilder:
                //         (context, url, downloadProgress) =>
                //             CircularProgressIndicator(
                //               value: downloadProgress.progress,
                //               color: AppColors.mainColor,
                //             ),
                //   ),
                //   // foregroundImage: userImageUrl != null
                //   //     // ? FileImage(userImage!)
                //   //     ? CachedNetworkImageProvider(
                //   //         userProvider.currentUser?.image ?? '',
                //   //       )
                //   //     : AssetImage(AppAssets.profileImage) as ImageProvider,
                // ),
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
