import 'dart:convert';

import 'package:aqua_watch_app/controllers/dialogs/dialog_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json'
};

String baseURL = dotenv.env["APIURL"] ?? '';

class AuthAPIController extends GetxController {
  final dialogController = Get.put(DialogsController());

  Future<bool> addUserToDB(String name, email, location, language,
      profilePicture, phoneNumber) async {
    dialogController.showLoadingDialog();

    try {
      var response = await http.post(Uri.parse('http://192.168.142.212:5000/user'),
          headers: requestHeaders,
          body: jsonEncode({
            "name": name,
            "email": email,
            "location": location,
            "language": language,
            "profilePicture": profilePicture,
            "phoneNumber": phoneNumber
          }));
      dialogController.hideDialog();

      if (response.statusCode != 200) {
        dialogController.showErrorDialog(response.body);
        return false;
      } else {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString("name", name);
        await prefs.setString("email", email);
        await prefs.setString("location", location);
        await prefs.setString("language", language);
        await prefs.setString("profilePicture", profilePicture);
        await prefs.setString("phoneNumber", phoneNumber);
      }

      return true;
    } catch (e) {
      print(e);
    }

    return false;
  }
}
