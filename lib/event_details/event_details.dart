import 'package:easy_localization/easy_localization.dart';
import 'package:evently/edit_event/widget/action_button_widget.dart';
import 'package:evently/model/app_data.dart';
import 'package:evently/model/event.dart';
import 'package:evently/on_boarding/widget/back_button_widget.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_routes.dart';
import 'package:evently/utils/dialog_utils.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:provider/provider.dart';

import '../utils/screen_size.dart';

class EventDetailsScreen extends StatefulWidget {
  const EventDetailsScreen({super.key});

  @override
  State<EventDetailsScreen> createState() => _EventDetailsScreenState();
}

class _EventDetailsScreenState extends State<EventDetailsScreen> {
  late Event event;
  late UserProvider userProvider;
  late EventsProvider eventsProvider;

  late int selectedIndex;

  AppDataClass data = AppDataClass();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  late String selectedImage;

  String eventTitle = '';
  String eventDescription = '';

  var formKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    event = ModalRoute.of(context)!.settings.arguments as Event;
    selectedIndex = data.eventsNameList.indexOf(event.eventName);
    selectedDate = event.eventDate;
    selectedTime = event.eventTime;
    eventDescription = event.eventDescription;
    eventTitle = event.eventTitle;
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    eventsProvider = Provider.of<EventsProvider>(context);
    selectedImage = context.isLight
        ? data.eventImagesLight[selectedIndex]
        : data.eventImagesDark[selectedIndex];
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(context.width * 0.04),
        actions: [
          ActionButtonWidget.edit(
            onPressed: () {
              Navigator.popAndPushNamed(
                context,
                AppRoutes.editEventRouteName,
                arguments: event,
              );
            },
          ),
          SizedBox(width: context.width * 0.025),
          ActionButtonWidget.delete(
            onPressed: () {
              DialogUtils.showMessage(
                title: 'warning',
                context: context,
                message: 'are_you_sure_you_want_to_delete_this_event',
                posActionText: 'yes',
                negActionText: 'no',
                posAction: () async {
                  DialogUtils.showLoading(context: context);
                  await eventsProvider
                      .deleteEvent(
                        event: event,
                        userId: userProvider.currentUser!.id,
                      )
                      .then((value) {
                        if (!context.mounted) return;
                        DialogUtils.hideLoading(context: context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              context.tr('event_was_deleted_successfully'),
                            ),
                          ),
                        );
                        Navigator.pop(context);
                      })
                      .onError((error, stackTrace) {
                        if (!context.mounted) return;
                        DialogUtils.hideLoading(context: context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.toString())),
                        );
                      });
                },
              );
            },
          ),
        ],
        centerTitle: true,
        title: Text(
          context.tr('event_details'),
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
                  image: AssetImage(selectedImage),
                ),
                border: Border.all(
                  color: context.isLight
                      ? AppColors.strokeColor
                      : AppColors.strokeDarkColor,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: context.height * 0.02),
              child: Text(
                event.eventTitle,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: context.isLight
                      ? AppColors.mainTextColor
                      : AppColors.whiteColor,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(context.width * 0.04),
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.isLight
                    ? AppColors.whiteColor
                    : AppColors.inputsColor,
                border: Border.all(
                  color: context.isLight
                      ? AppColors.strokeColor
                      : AppColors.strokeDarkColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                spacing: context.width * 0.04,
                children: [
                  Container(
                    padding: EdgeInsets.all(context.width * 0.028),
                    decoration: BoxDecoration(
                      color: context.isLight
                          ? AppColors.backgroundColor
                          : AppColors.inputsColor,
                      border: Border.all(
                        color: context.isLight
                            ? AppColors.strokeColor
                            : AppColors.strokeDarkColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Iconsax.calendar_add_outline,
                      color: context.isLight
                          ? AppColors.mainColor
                          : AppColors.mainDarkModeColor,
                      size: 32,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat(
                          'd MMMM',
                          context.locale.toString(),
                        ).format(event.eventDate),
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: context.isLight
                              ? AppColors.mainTextColor
                              : AppColors.mainDarkModeColor,
                        ),
                      ),
                      Text(
                        event.eventTime.format(context),
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: context.isLight
                              ? AppColors.disableColor
                              : AppColors.secTextDarkModeColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.fromLTRB(
                0,
                context.height * 0.02,
                0,
                context.height * 0.008,
              ),
              child: Text(
                context.tr('description'),
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            Container(
              padding: EdgeInsets.all(context.width * 0.04),
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.isLight
                    ? AppColors.whiteColor
                    : AppColors.inputsColor,
                border: Border.all(
                  color: context.isLight
                      ? AppColors.strokeColor
                      : AppColors.strokeDarkColor,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                event.eventDescription,
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void deleteEvent() {
  //   DialogUtils.showMessage(
  //     title: 'warning',
  //     context: context,
  //     message: 'are_you_sure_you_want_to_delete_this_event',
  //     posAction: () async {
  //       DialogUtils.showLoading(context: context);
  //       await FirebaseUtils.deleteEvent(
  //         event,
  //         userProvider.currentUser!.id,
  //       ).then((value) {
  //         if (!mounted) return;
  //         DialogUtils.hideLoading(context: context);
  //         eventsProvider.eventsListener(userProvider.currentUser!.id);
  //         ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(
  //             content: Text(context.tr('event_was_deleted_successfully')),
  //           ),
  //         );
  //         Navigator.pop(context);
  //       });
  //     },
  //     posActionText: 'yes',
  //
  //     negActionText: 'no',
  //   );
  // }
}
