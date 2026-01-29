import 'package:flutter/material.dart';

import '../firebase_utils.dart';
import '../model/event.dart';

class EventsProvider extends ChangeNotifier {
  List<Event> eventList = [];
  List<Event> filterEventList = [];

  void getAllEventsFromFirestore() async {
    var querySnapshots = await FirebaseUtils.getEventsCollection().get();
    eventList = querySnapshots.docs.map((doc) => doc.data()).toList();
    notifyListeners();
  }

  void getFilterEventsFromFirestore(int index,
      String selectedEventName,) async {
    getAllEventsFromFirestore();
    filterEventList = index == 0
        ? eventList
        : eventList
        .where((event) => event.eventName == selectedEventName)
        .toList();

    notifyListeners();
  }
}
