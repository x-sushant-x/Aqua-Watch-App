import 'package:aqua_watch_app/screens/home.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  static isLoggedIn() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      String? email = prefs.getString("email");

      if (email != null) {
        Get.to(MyHomePage());
      }
    } catch (e) {
      print("Handling Error: $e");
    }
  }
}
