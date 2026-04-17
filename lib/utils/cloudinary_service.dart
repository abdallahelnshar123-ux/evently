import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class CloudinaryService {
  static const String cloudName = "der5mc1es";
  static const String uploadPreset = "user_avatar";

  static Future<String?> uploadImage(File file) async {
    final url = Uri.parse(
      "https://api.cloudinary.com/v1_1/$cloudName/image/upload",
    );

    var request = http.MultipartRequest('POST', url);

    request.fields['upload_preset'] = uploadPreset;

    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    var response = await request.send();

    if (response.statusCode == 200) {
      final resData = await response.stream.bytesToString();
      final jsonData = json.decode(resData);

      return jsonData['secure_url'];
    } else {
      return null;
    }
  }
}
