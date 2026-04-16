import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event.dart';
import 'package:evently/model/my_user.dart';

class FirebaseUtils {
  /// events ==============================================================
  static CollectionReference<Event> getEventsCollection(String uId) {
    return getUSersCollection()
        .doc(uId)
        .collection(Event.collectionName)
        .withConverter<Event>(
          fromFirestore: (snapshot, options) =>
              Event.fromFireStore(snapshot.data()!),
          toFirestore: (event, options) => event.toFireStore(),
        );
  }

  static Stream<List<Event>> getEventsStream(String userId) {
    return getEventsCollection(userId).orderBy('event_date').snapshots().map((
      snapshot,
    ) {
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  static Future<void> addEventsToFirestore(Event event, String userId) {
    var collection = getEventsCollection(userId);
    var document = collection.doc();
    event.id = document.id;
    return document.set(event);
  }

  static Future<void> updateEvents(Event event, String userId) {
    var collection = getEventsCollection(userId);
    var document = collection.doc(event.id);
    return document.update(event.toFireStore());
  }

  static Future<void> deleteEvent(Event event, String userId) {
    var collection = getEventsCollection(userId);
    var document = collection.doc(event.id);
    return document.delete();
  }

  /// user =============================================================
  static CollectionReference<MyUser> getUSersCollection() {
    return FirebaseFirestore.instance
        .collection(MyUser.usersCollectionName)
        .withConverter<MyUser>(
          fromFirestore: (snapshot, options) =>
              MyUser.fromFirestore(snapshot.data()!),
          toFirestore: (user, options) => user.toFirestore(),
        );
  }

  static Future<void> addUserToFirestore(MyUser user) {
    return getUSersCollection().doc(user.id).set(user);
  }

  static Future<MyUser?> getUserFromFirestore(String userId) async {
    var querySnapshot = await getUSersCollection().doc(userId).get();
    return querySnapshot.data();
  }

  static Future<void> updateUserImage({
    required String userId,
    required String imageUrl,
  }) async {
    await getUSersCollection().doc(userId).update({'image': imageUrl});
  }
}
