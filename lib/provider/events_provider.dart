import 'dart:async';

import 'package:evently/model/app_data.dart';
import 'package:flutter/material.dart';

import '../firebase_utils.dart';
import '../model/event.dart';

class EventsProvider extends ChangeNotifier {
  List<Event> eventList = [];
  List<Event> filterEventList = [];
  List<Event> favoriteEventsList = [];
  int selectedIndex = 0;
  StreamSubscription<List<Event>>? _eventsSubscription;
  AppDataClass data = AppDataClass();

  @override
  void dispose() {
    _eventsSubscription?.cancel();
    super.dispose();
  }

  void emptyLists() {
    filterEventList = [];
    favoriteEventsList = [];
    notifyListeners();
  }

  void eventsListener(String userId) {
    _eventsSubscription?.cancel();

    _eventsSubscription =
        FirebaseUtils.getEventsStream(userId).listen((events,) {
          eventList = events;
          filterEvents();
        });
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

    favoriteEventsList = eventList.where((event) => event.isFavorite).toList();
    favoriteEventsList.sort((event1, event2) {
      return event1.eventDate.compareTo(event2.eventDate);
    });
    notifyListeners();
  }

  Future<void> updateIsFavorite(Event event, String uId) async {
    await FirebaseUtils.getEventsCollection(
      uId,
    ).doc(event.id).update({'is_favorite': !event.isFavorite}).then((value) {
      // eventsListener(uId);
      // getFavoriteEvents(uId);
    });
  }

  // void getFavoriteEvents(String uId) async {
  //   var querySnapShots = await FirebaseUtils.getEventsCollection(uId)
  //       .orderBy('event_date')
  //       .where('is_favorite', isEqualTo: true)
  //       .get();
  //   favoriteEventsList = querySnapShots.docs.map((doc) => doc.data()).toList();
  //
  //   notifyListeners();
  // }

  Future<void> deleteEvent(
      {required Event event, required String userId}) async {
    await FirebaseUtils.deleteEvent(event, userId);
  }

  void setIndex(int index) {
    if (selectedIndex == index) return;

    selectedIndex = index;
    filterEvents();
  }
}
