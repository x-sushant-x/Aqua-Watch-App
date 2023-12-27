import 'dart:convert';

import 'package:aqua_watch_app/controllers/dialogs/dialog_controller.dart';
import 'package:aqua_watch_app/model/user/login_user.dart';
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
      var response = await http.post(Uri.parse('$baseURL/user'),
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
        prefs.clear();
        await prefs.setString("name", name);
        await prefs.setString("email", email);
        await prefs.setString("location", location);
        await prefs.setString("language", language);
        await prefs.setString("profilePicture", profilePicture);
        await prefs.setString("phoneNumber", phoneNumber);
      }

      return true;
    } catch (e) {
      dialogController.hideDialog();
      print(e);
    }

    return false;
  }

  Future<bool> addNGOToDB(String name, email, location,
      profilePicture, phoneNumber, String description) async {
    dialogController.showLoadingDialog();

    try {
      var response = await http.post(Uri.parse('$baseURL/ngo/signup'),
          headers: requestHeaders,
          body: jsonEncode({
            "name": name,
            "email": email,
            "location": location,
            "description": description,
            "image_url": profilePicture,
            "phone_number": phoneNumber
          }));
      dialogController.hideDialog();

      if (response.statusCode != 200) {
        dialogController.showErrorDialog(response.body);
        return false;
      } else {
        
        final prefs = await SharedPreferences.getInstance();
        prefs.clear();
        await prefs.setString("name", name);
        await prefs.setString("email", email);
        await prefs.setString("location", location);
        await prefs.setString("description", description);
        await prefs.setString("image_url", profilePicture);
        await prefs.setString("phone_number", phoneNumber);
      }

      return true;
    } catch (e) {
      dialogController.hideDialog();
      print(e);
    }

    return false;
  }

  Future<bool> loginFromDB(String email) async {
    try {
      dialogController.showLoadingDialog();
      var response = await http.get(
        Uri.parse('$baseURL/login?email=$email'),
        headers: requestHeaders,
      );

      print(response.body);
      dialogController.hideDialog();

      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final resp = LoginUserResponse.fromJson(body);

        final prefs = await SharedPreferences.getInstance();
        prefs.clear();
        await prefs.setString("id", resp.user.id);
        await prefs.setString("name", resp.user.name);
        await prefs.setString("email", resp.user.email);
        await prefs.setString("location", resp.user.location);
        await prefs.setString("language", resp.user.language);
        await prefs.setString("profilePicture", resp.user.profilePicture);
        await prefs.setString("phoneNumber", resp.user.phoneNumber);
        print('Details Set For User ${resp.user.id}');
      }

      if (response.statusCode != 200) {
        dialogController.showErrorDialog(response.body);
        return false;
      }
      return true;
    } catch (e) {
      dialogController.hideDialog();
      print(e);
    }
    return false;
  }

  Future<bool> loginNGOFromDB(String email) async {
    try {
      dialogController.showLoadingDialog();
      var response = await http.get(
        Uri.parse('$baseURL/ngo/login?email=$email'),
      );
      print(response.body);
      dialogController.hideDialog();

      final body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final resp = LoginUserResponse.fromJson(body);

        final prefs = await SharedPreferences.getInstance();
        prefs.clear();
        await prefs.setString("name", resp.user.name);
        await prefs.setString("email", resp.user.email);
        await prefs.setString("location", resp.user.location);
        await prefs.setString("description", resp.user.location);
        await prefs.setString("image_url", resp.user.profilePicture);
        await prefs.setString("phone_number", resp.user.phoneNumber);
        print('Details Set For User ${resp.user.id}');
      }

      if (response.statusCode != 200) {
        dialogController.showErrorDialog(response.body);
        return false;
      }
      return true;
    } catch (e) {
      dialogController.hideDialog();
      print(e);
    }
    return false;
  }
}
