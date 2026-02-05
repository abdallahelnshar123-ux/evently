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

  void emptyLists() {
    filterEventList = [];
    favoriteEventsList = [];
  }

  Future<void> getEvents(String uId) async {
    var querySnapshots = await FirebaseUtils.getEventsCollection(uId).get();
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

  Future<void> updateIsFavorite(Event event, String uId) async {
    await FirebaseUtils.getEventsCollection(uId)
        .doc(event.id)
        .update({'is_favorite': !event.isFavorite})
        .then((value) {
      getEvents(uId);
      getFavoriteEvents(uId);
    });

    // .timeout(
    //   Duration(milliseconds: 500),
    //   onTimeout: () {
    //     getEvents();
    //     getFavoriteEvents();
    //   },
    // );
  }

  void getFavoriteEvents(String uId) async {
    var querySnapShots = await FirebaseUtils.getEventsCollection(uId)
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
