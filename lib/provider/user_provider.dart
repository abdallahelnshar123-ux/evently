import 'package:evently/model/my_user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  MyUser? _currentUser;

  MyUser? get currentUser => _currentUser;

  void changeUser(MyUser? newUser) {
    _currentUser = newUser;
    notifyListeners();
  }

  void initUser(MyUser? newUser) {
    _currentUser = newUser;
  }
}
