import 'dart:convert';
import 'dart:io';

import 'package:aqua_watch_app/controllers/authentication/location_controller.dart';
import 'package:aqua_watch_app/controllers/dialogs/dialog_controller.dart';
import 'package:aqua_watch_app/screens/home_page.dart';
import 'package:aqua_watch_app/view/onboarding/splash.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NewPostController extends GetxController {
  Map<String, String> requestHeaders = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };

  String baseURL = dotenv.env["APIURL"] ?? '';

  Future<String> uploadImageToFirebase(File image) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference storageReference =
        storage.ref().child('images/${DateTime.now()}.png');

    UploadTask uploadTask = storageReference.putFile(image);
    TaskSnapshot snapshot = await uploadTask;

    if (snapshot.state == TaskState.success) {
      final String downloadURL = await snapshot.ref.getDownloadURL();
      return downloadURL;
    }
    return "";
  }

  Future<void> addNewPost(File? image, String description) async {
    final dialogController = Get.put(DialogsController());
    dialogController.showLoadingDialog();

    final locationController = Get.put(LocationController());

    // Fetching location coordinates
    Position location = await Geolocator.getCurrentPosition();
    final address = await locationController.getAddressFromLatLng(
        location.latitude, location.longitude);

    final String url = await uploadImageToFirebase(image!);

    // Geting user data
    final prefs = await SharedPreferences.getInstance();
    final userID = prefs.getString("id");

    DateTime now = DateTime.now();
    final date =
        '${now.year}-${_addLeadingZero(now.month)}-${_addLeadingZero(now.day)}';
    final time =
        '${_get12HourFormat(now.hour)}:${_addLeadingZero(now.minute)} ${_getAMPM(now.hour)}';

    final body = jsonEncode({
      "user": userID,
      "date": date,
      "time": time,
      "imageUrl": url,
      "description": description,
      "damageScore": 1,
      "coordinates": [location.latitude, location.longitude],
      "location": address
    });

    final resp = await http.post(Uri.parse('$baseURL/post'),
        headers: requestHeaders, body: body);

    dialogController.hideDialog();

    if (resp.statusCode == 200) {
      Get.offAll(SplashPage());
    } else {
      dialogController.showErrorDialog(
          'Error', 'Unable to upload this post: ${resp.body}');
    }
  }

  String _addLeadingZero(int number) {
    // Add a leading zero if the number is less than 10
    return number.toString().padLeft(2, '0');
  }

  String _get12HourFormat(int hour) {
    if (hour > 12) {
      return '${hour - 12}';
    } else if (hour == 0) {
      return '12';
    } else {
      return '$hour';
    }
  }

  String _getAMPM(int hour) {
    return hour >= 12 ? 'PM' : 'AM';
  }
}
