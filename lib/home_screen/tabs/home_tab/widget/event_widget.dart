import 'package:easy_localization/easy_localization.dart';
import 'package:evently/home_screen/tabs/home_tab/widget/Container_child.dart';
import 'package:evently/model/event.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  const EventWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    var eventsProvider = Provider.of<EventsProvider>(context);
    var userProvider = Provider.of<UserProvider>(context);
    return Container(
      padding: EdgeInsets.all(context.width * 0.02),
      width: double.infinity,
      height: context.height * 0.24,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            context.isLight
                ? event.eventImage.replaceAll('dark', 'light')
                : event.eventImage.replaceAll('light', 'dark'),
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
              DateFormat('d MMM').format(event.eventDate),
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
                  event.eventTitle,
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
                  isSelected: event.isFavorite,
                  padding: EdgeInsets.zero,
                  iconSize: 30,
                  color: context.isLight
                      ? AppColors.mainColor
                      : AppColors.mainDarkModeColor,
                  onPressed: () {
                    eventsProvider.updateIsFavorite(
                        event, userProvider.currentUser!.id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 3),
                        content: Text(
                          context.tr(
                            event.isFavorite
                                ? 'removed_favorite'
                                : 'added_favorite',
                          ),
                        ),
                      ),
                    );
                  },
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
