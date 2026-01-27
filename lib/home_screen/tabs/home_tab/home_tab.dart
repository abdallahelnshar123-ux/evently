import 'package:easy_localization/easy_localization.dart';
import 'package:evently/home_screen/tabs/home_tab/widget/event_widget.dart';
import 'package:evently/home_screen/tabs/home_tab/widget/tab_bar_widget.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../model/app_data.dart';
import '../../../model/event.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEventsFromFirestore();
  }

  int selectedIndex = 0;
  AppDataClass data = AppDataClass();
  List<Event> eventList = [];

  @override
  Widget build(BuildContext context) {
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
                        'Abdallah Elnshar',
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
                    selectedIndex = index;
                    setState(() {});
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
                              selectedIndex ==
                              data.homeEventsNameList.indexOf(eventName),
                          eventName: eventName,
                          icon:
                              selectedIndex ==
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
                child: eventList.isEmpty
                    ? Center(
                        child: Text(
                          context.tr('no_events_yet'),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      )
                    : ListView.separated(
                        itemBuilder: (context, index) =>
                            EventWidget(event: eventList[index]),
                        separatorBuilder: (context, index) =>
                            SizedBox(height: context.height * 0.019),
                        itemCount: eventList.length,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getEventsFromFirestore() {}
}
