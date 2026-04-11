import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event.dart';
import 'package:evently/model/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseUtils {
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

  static Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignIn signIn = GoogleSignIn.instance;
    await signIn.initialize(
      clientId:
          '952355362314-f27f5ubpkl9a3f08mkdp14bqmcuugtnn.apps.googleusercontent.com',
    );

    final GoogleSignInAccount? googleUser = await signIn.authenticate();
    if (googleUser != null) {
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

    return null;
  }
}
