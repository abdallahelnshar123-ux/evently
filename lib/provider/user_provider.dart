import 'dart:io';

import 'package:evently/model/my_user.dart';
import 'package:flutter/material.dart';

import '../firebase_utils.dart';
import '../utils/cloudinary_service.dart';
import '../utils/image_service.dart';
import '../utils/local_storage.dart';

class UserProvider extends ChangeNotifier {
  MyUser? _currentUser;

  MyUser? get currentUser => _currentUser;

  void changeUser(MyUser? newUser) {
    _currentUser = newUser;
    notifyListeners();
  }

  void changeUserAvatar() async {
    File? image = await ImageService.pickImage();
    if (image != null) {
      String? imageUrl = await CloudinaryService.uploadImage(image);
      if (imageUrl == null) return;
      await FirebaseUtils.updateUserImage(
        userId: currentUser?.id ?? '',
        imageUrl: imageUrl,
      );

      MyUser user = MyUser(
        id: currentUser?.id ?? "",
        email: currentUser?.email ?? "",
        name: currentUser?.name ?? "",
        image: imageUrl,
      );
      LocalStorage.instance.saveUser(user);
      changeUser(user);
    }
  }

  void initUser(MyUser? newUser) {
    _currentUser = newUser;
  }
}
