import 'package:evently/model/app_data.dart';
import 'package:flutter/material.dart';

import '../firebase_utils.dart';
import '../model/event.dart';

class EventsProvider extends ChangeNotifier {
  List<Event> eventList = [];
  List<Event> filterEventList = [];
  int selectedIndex = 0;

  AppDataClass data = AppDataClass();

  Future<void> getEvents() async {
    var querySnapshots = await FirebaseUtils.getEventsCollection().get();
    eventList = querySnapshots.docs.map((doc) => doc.data()).toList();
    filterEvents();
    notifyListeners();
  }

  void filterEvents() {
    filterEventList = selectedIndex == 0
        ? eventList
        : eventList
              .where(
                (event) =>
                    event.eventName == data.homeEventsNameList[selectedIndex],
              )
              .toList();

    notifyListeners();
  }

  void setIndex(int index) {
    selectedIndex = index;
    filterEvents();
  }
}
