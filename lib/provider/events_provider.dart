import 'package:evently/model/app_data.dart';
import 'package:flutter/material.dart';

import '../firebase_utils.dart';
import '../model/event.dart';

class EventsProvider extends ChangeNotifier {
  List<Event> eventList = [];
  List<Event> filterEventList = [];
  List<Event> favoriteEventsList = [];
  int selectedIndex = 0;

  AppDataClass data = AppDataClass();

  Future<void> getEvents() async {
    var querySnapshots = await FirebaseUtils.getEventsCollection().get();
    eventList = querySnapshots.docs.map((doc) => doc.data()).toList();
    filterEvents();
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
    filterEventList.sort((event1, event2) {
      return event1.eventDate.compareTo(event2.eventDate);
    });
    notifyListeners();
  }

  Future<void> updateIsFavorite(Event event) async {
    await FirebaseUtils.getEventsCollection()
        .doc(event.id)
        .update({'is_favorite': !event.isFavorite})
        .timeout(
          Duration(milliseconds: 500),
          onTimeout: () {
            getEvents();
            getFavoriteEvents();
          },
        );
  }

  void getFavoriteEvents() async {
    var querySnapShots = await FirebaseUtils.getEventsCollection()
        .orderBy('event_date')
        .where('is_favorite', isEqualTo: true)
        .get();
    favoriteEventsList = querySnapShots.docs.map((doc) => doc.data()).toList();

    notifyListeners();
  }

  void setIndex(int index) {
    if (selectedIndex == index) return;

    selectedIndex = index;
    filterEvents();
  }
}
