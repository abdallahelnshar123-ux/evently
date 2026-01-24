import 'package:easy_localization/easy_localization.dart';
import 'package:evently/home_screen/tabs/home_tab/widget/event_widget.dart';
import 'package:evently/home_screen/tabs/home_tab/widget/tab_bar_widget.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:icons_plus/icons_plus.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int selectedIndex = 0;

  List<String> eventsNameList = [
    'all',
    'sport',
    'birthday',
    'meeting',
    'gaming',
    'workshop',
    'book_club',
    'exhibition',
    'holiday',
    'eating',
  ];

  List<IconData> selectedIcons = [
    Icons.window,
    MingCute.football_fill,
    Icons.cake,
    Icons.group,
    Icons.videogame_asset_rounded,
    Icons.group_work,
    Bootstrap.book_fill,
    Clarity.image_gallery_solid,
    Clarity.on_holiday_solid,
    Icons.fastfood,
  ];

  List<IconData> unSelectedIcons = [
    Icons.window,
    MingCute.football_line,
    Icons.cake_outlined,
    Icons.group_outlined,
    Icons.videogame_asset_outlined,
    Icons.group_work_outlined,
    Bootstrap.book,
    Clarity.image_gallery_line,
    Clarity.on_holiday_line,
    Icons.fastfood_outlined,
  ];

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
                        style: Theme.of(context).textTheme.headlineMedium,
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
                length: eventsNameList.length,
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
                  tabs: eventsNameList
                      .map(
                        (eventName) => TabBarWidget(
                          icon:
                              selectedIndex == eventsNameList.indexOf(eventName)
                              ? selectedIcons[eventsNameList.indexOf(eventName)]
                              : unSelectedIcons[eventsNameList.indexOf(
                                  eventName,
                                )],
                          isSelected:
                              selectedIndex ==
                              eventsNameList.indexOf(eventName),
                          eventName: eventName,
                        ),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) => EventWidget(),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: context.height * 0.019),
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
