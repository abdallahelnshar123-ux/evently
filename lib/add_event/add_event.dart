import 'package:easy_localization/easy_localization.dart';
import 'package:evently/add_event/widget/date_time_widget.dart';
import 'package:evently/on_boarding/widget/back_button_widget.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/utils/app_assets.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_data.dart';
import 'package:flutter/material.dart';

import '../authentication/widget/custom_text_field.dart';
import '../home_screen/tabs/home_tab/widget/tab_bar_widget.dart';
import '../on_boarding/widget/custom_elevated_button.dart';
import '../utils/app_styles.dart';
import '../utils/screen_size.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  int selectedIndex = 0;
  AppDataClass data = AppDataClass();
  DateTime? selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          context.tr('add_event'),
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: context.isLight
                ? AppColors.mainTextColor
                : AppColors.whiteColor,
          ),
        ),
        leading: BackButtonWidget(
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(context.width * 0.04),
        child: Column(
          spacing: context.height * 0.005,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
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
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            DefaultTabController(
              length: data.eventsNameList.length,
              child: TabBar(
                onTap: (index) {
                  selectedIndex = index;
                  setState(() {});
                },
                tabAlignment: TabAlignment.start,
                padding: EdgeInsets.symmetric(vertical: context.height * 0.029),
                isScrollable: true,
                dividerColor: AppColors.transparentColor,
                indicatorColor: AppColors.transparentColor,
                labelPadding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.01,
                ),
                tabs: data.eventsNameList
                    .map(
                      (eventName) => TabBarWidget(
                        icon:
                        selectedIndex ==
                            data.eventsNameList.indexOf(eventName)
                            ? data.selectedIcons[data.eventsNameList.indexOf(
                          eventName,
                        )]
                            : data.unselectedIcons[data.eventsNameList.indexOf(
                                eventName,
                              )],
                        isSelected:
                        selectedIndex ==
                            data.eventsNameList.indexOf(eventName),
                        eventName: eventName,
                      ),
                    )
                    .toList(),
              ),
            ),
            Text(
              context.tr('title'),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            CustomTextField(
              dataStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
              filled: true,
              fillColor: context.isLight
                  ? AppColors.whiteColor
                  : AppColors.inputsColor,

              hintText: context.tr('search_for_event'),
              hintStyle: Theme.of(context).textTheme.labelSmall,

              errorBorderColor: AppColors.redColor,
              generalBorderColor: context.isLight
                  ? AppColors.strokeColor
                  : AppColors.strokeDarkColor,
            ),
            SizedBox(height: context.height * 0.004),
            Text(
              context.tr('event_title'),
              style: Theme.of(context).textTheme.labelLarge,
            ),
            CustomTextField(
              maxLines: 6,
              dataStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.none,
              ),
              filled: true,
              fillColor: context.isLight
                  ? AppColors.whiteColor
                  : AppColors.inputsColor,

              hintText: context.tr('event_description'),
              hintStyle: Theme.of(context).textTheme.labelSmall,

              errorBorderColor: AppColors.redColor,
              generalBorderColor: context.isLight
                  ? AppColors.strokeColor
                  : AppColors.strokeDarkColor,
            ),
            SizedBox(height: context.height * 0.004),

            DateTimeWidget.date(
              onPressed: pickDate,
              hyperText: selectedDate == null
                  ? context.tr('choose_date')
                  : DateFormat('MMM d, yyyy', Intl.defaultLocale).format(
                  selectedDate!),
            ),
            DateTimeWidget.time(
              onPressed: pickDate,
              hyperText: context.tr('choose_time'),
            ),
            SizedBox(height: context.height * 0.01),

            CustomElevatedButton(
              onPressed: () {},
              backgroundColor: context.isLight
                  ? AppColors.mainColor
                  : AppColors.mainDarkModeColor,
              child: Text(
                context.tr('add_event'),
                style: AppStyles.sBold20White,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void pickDate() async {
    var chooseDate = await showDatePicker(
      locale: Locale(Intl.defaultLocale!),
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      initialDate: DateTime.now(),
    );
    selectedDate = chooseDate;
    setState(() {});
  }
}
