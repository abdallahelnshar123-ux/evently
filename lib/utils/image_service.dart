import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageService {
  static final ImagePicker _picker = ImagePicker();

  static Future<File?> pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (pickedFile == null) return null;

    return File(pickedFile.path);
  }
}
