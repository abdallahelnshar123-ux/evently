import 'package:easy_localization/easy_localization.dart';
import 'package:evently/home_screen/tabs/home_tab/widget/event_widget.dart';
import 'package:evently/home_screen/tabs/home_tab/widget/tab_bar_widget.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../model/app_data.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  late EventsProvider eventsProvider;
  late UserProvider userProvider;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      eventsProvider.eventsListener(userProvider.currentUser!.id);
    });
  }

  AppDataClass data = AppDataClass();

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);

    eventsProvider = Provider.of<EventsProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(
            context.width * 0.04,
            context.width * 0.07,
            context.width * 0.04,
            0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    spacing: context.height * 0.01,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.tr('welcome_back'),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      Text(
                        userProvider.currentUser!.name,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                  Row(
                    spacing: 10,
                    children: [
                      SvgPicture.asset(
                        width: 26,
                        context.isLight
                            ? AppAssets.sunUnselectedIcon
                            : AppAssets.moonUnselectedIcon,
                        colorFilter: ColorFilter.mode(
                          context.isLight
                              ? AppColors.mainColor
                              : AppColors.mainDarkModeColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: context.isLight
                              ? AppColors.mainColor
                              : AppColors.mainDarkModeColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        width: 34,
                        height: 34,

                        child: Text(
                          context.tr('en'),
                          style: Theme.of(context).textTheme.labelMedium!
                              .copyWith(color: AppColors.whiteColor),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              DefaultTabController(
                length: data.homeEventsNameList.length,
                child: TabBar(
                  onTap: (index) {
                    eventsProvider.setIndex(index);
                  },
                  tabAlignment: TabAlignment.start,
                  padding: EdgeInsets.symmetric(
                    vertical: context.height * 0.029,
                  ),
                  isScrollable: true,
                  dividerColor: AppColors.transparentColor,
                  indicatorColor: AppColors.transparentColor,
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: context.width * 0.01,
                  ),
                  tabs: data.homeEventsNameList
                      .map(
                        (eventName) => TabBarWidget(
                          isSelected:
                              eventsProvider.selectedIndex ==
                              data.homeEventsNameList.indexOf(eventName),
                          eventName: eventName,
                          icon:
                              eventsProvider.selectedIndex ==
                                  data.homeEventsNameList.indexOf(eventName)
                              ? data.homeSelectedIcons[data.homeEventsNameList
                                    .indexOf(eventName)]
                              : data.homeUnselectedIcons[data.homeEventsNameList
                                    .indexOf(eventName)],
                        ),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                child: eventsProvider.filterEventList.isEmpty
                    ? Center(
                        child: Text(
                          context.tr('no_events_yet'),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    : ListView.separated(
                        padding: EdgeInsets.only(bottom: context.height * 0.1),
                        itemBuilder: (context, index) => EventWidget(
                          event: eventsProvider.filterEventList[index],
                        ),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: context.height * 0.019),
                        itemCount: eventsProvider.filterEventList.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
