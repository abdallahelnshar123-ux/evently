import 'package:evently/home_screen/tabs/home_tab/widget/Container_child.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.width * 0.02),
      width: double.infinity,
      height: context.height * 0.24,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            context.isLight
                ? AppAssets.meetingImageLight
                : AppAssets.meetingImageDark,
          ),
        ),
        border: Border.all(
          color: context.isLight
              ? AppColors.strokeColor
              : AppColors.strokeDarkColor,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ContainerChild(
            child: Text(
              '21 Jan',
              style: Theme.of(
                context,
              ).textTheme.displaySmall!.copyWith(fontSize: 16),
            ),
          ),
          ContainerChild(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Event Description',
                  style: Theme.of(
                    context,
                  ).textTheme.labelLarge!.copyWith(fontSize: 14),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    padding: EdgeInsets.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  selectedIcon: Icon(Icons.favorite_rounded),
                  isSelected: false,
                  padding: EdgeInsets.zero,
                  iconSize: 30,
                  color: context.isLight
                      ? AppColors.mainColor
                      : AppColors.mainDarkModeColor,
                  onPressed: () {},
                  icon: Icon(Icons.favorite_border_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
