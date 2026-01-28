import 'package:flutter/material.dart';

import '../firebase_utils.dart';
import '../model/event.dart';

class EventsProvider extends ChangeNotifier {
  List<Event> eventList = [];

  void getEventsFromFirestore() async {
    var querySnapshots = await FirebaseUtils.getEventsCollection().get();
    eventList = querySnapshots.docs.map((doc) => doc.data()).toList();
    notifyListeners();
  }
}
