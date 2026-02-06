import 'package:easy_localization/easy_localization.dart';
import 'package:evently/add_event/widget/alert_dialog_widget.dart';
import 'package:evently/add_event/widget/date_time_widget.dart';
import 'package:evently/firebase_utils.dart';
import 'package:evently/model/app_data.dart';
import 'package:evently/model/event.dart';
import 'package:evently/on_boarding/widget/back_button_widget.dart';
import 'package:evently/provider/app_theme_provider.dart';
import 'package:evently/provider/events_provider.dart';
import 'package:evently/provider/user_provider.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../authentication/widget/custom_text_field.dart';
import '../home_screen/tabs/home_tab/widget/tab_bar_widget.dart';
import '../on_boarding/widget/custom_elevated_button.dart';
import '../utils/app_styles.dart';
import '../utils/screen_size.dart';

class EditEventScreen extends StatefulWidget {
  const EditEventScreen({super.key});

  @override
  State<EditEventScreen> createState() => _EditEventScreenState();
}

class _EditEventScreenState extends State<EditEventScreen> {
  late Event event;
  late EventsProvider eventsProvider;
  late UserProvider userProvider;
  late int selectedIndex;

  AppDataClass data = AppDataClass();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String selectedEventName = '';
  late String selectedImage;

  String eventTitle = '';
  String eventDescription = '';

  bool _isInitialized = false;
  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    if (_isInitialized) return;
    event = ModalRoute.of(context)!.settings.arguments as Event;
    selectedIndex = data.eventsNameList.indexOf(event.eventName);
    selectedEventName = data.eventsNameList[selectedIndex];
    selectedDate = event.eventDate;
    selectedTime = event.eventTime;
    eventDescription = event.eventDescription;
    eventTitle = event.eventTitle;
    _isInitialized = true;
  }

  @override
  Widget build(BuildContext context) {
    eventsProvider = Provider.of<EventsProvider>(context);
    userProvider = Provider.of<UserProvider>(context);
    selectedImage = context.isLight
        ? data.eventImagesLight[selectedIndex]
        : data.eventImagesDark[selectedIndex];
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            context.tr('edit_event'),
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
          child: Form(
            key: formKey,
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
                DefaultTabController(
                  length: data.eventsNameList.length,
                  child: TabBar(
                    onTap: (index) {
                      selectedIndex = index;
                      selectedEventName = data.eventsNameList[selectedIndex];
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
                    tabs: data.eventsNameList
                        .map(
                          (eventName) => TabBarWidget(
                            icon:
                                selectedIndex ==
                                    data.eventsNameList.indexOf(eventName)
                                ? data.selectedIcons[data.eventsNameList
                                      .indexOf(eventName)]
                                : data.unselectedIcons[data.eventsNameList
                                      .indexOf(eventName)],
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
                  initialValue: event.eventTitle,
                  onChanged: (text) {
                    eventTitle = text;
                  },
                  validator: (text) {
                    if (text?.trim().isEmpty ?? true) {
                      return context.tr('please_enter_event_title');
                    }
                    return null;
                  },

                  dataStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.none,
                  ),
                  filled: true,
                  fillColor: context.isLight
                      ? AppColors.whiteColor
                      : AppColors.inputsColor,

                  hintText: context.tr('event_title'),
                  hintStyle: Theme.of(context).textTheme.labelSmall,

                  errorBorderColor: AppColors.redColor,
                  generalBorderColor: context.isLight
                      ? AppColors.strokeColor
                      : AppColors.strokeDarkColor,
                ),
                SizedBox(height: context.height * 0.004),
                Text(
                  context.tr('description'),
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                CustomTextField(
                  initialValue: event.eventDescription,
                  validator: (text) {
                    if (text?.trim().isEmpty ?? true) {
                      return context.tr('please_enter_event_description');
                    }
                    return null;
                  },
                  onChanged: (text) {
                    eventDescription = text;
                  },
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
                  hyperText: DateFormat(
                    'MMM d, yyyy',
                    context.locale.toString(),
                  ).format(selectedDate!),
                ),
                DateTimeWidget.time(
                  onPressed: pickTime,
                  hyperText: selectedTime!.format(context),
                ),
                SizedBox(height: context.height * 0.01),

                CustomElevatedButton(
                  onPressed: updateEvent,
                  backgroundColor: context.isLight
                      ? AppColors.mainColor
                      : AppColors.mainDarkModeColor,
                  child: Text(
                    context.tr('update_event'),
                    style: AppStyles.sBold20White,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void pickDate() async {
    var chooseDate = await showDatePicker(
      locale: context.locale,
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      initialDate: selectedDate,
    );
    selectedDate = chooseDate;
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {});
  }

  void pickTime() async {
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: selectedTime!,
    );
    selectedTime = chooseTime;
    FocusManager.instance.primaryFocus?.unfocus();
    setState(() {});
  }

  void updateEvent() async {
    if (selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialogWidget(
          title: 'date_error',
          errorMessage: 'please_choose_event_date',
        ),
      );
      return;
    }
    if (selectedTime == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialogWidget(
          title: 'time_error',
          errorMessage: 'please_choose_event_time',
        ),
      );
      return;
    }
    if (formKey.currentState!.validate()) {
      Event newEvent = Event(
        id: event.id,
        eventName: selectedEventName,
        eventDescription: eventDescription,
        eventTitle: eventTitle,
        eventImage: selectedImage,
        eventDate: selectedDate!,
        eventTime: selectedTime!,
      );
      await FirebaseUtils.updateEvents(
        newEvent,
        userProvider.currentUser!.id,
      ).then((value) {
        if (!mounted) return;
        eventsProvider.getEvents(userProvider.currentUser!.id);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(context.tr('event_was_updated_successfully'))),
        );
        Navigator.pop(context);
      });
    }
  }
}
