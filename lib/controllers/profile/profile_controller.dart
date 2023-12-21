import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  RxString name = ''.obs;
  RxString profilePicture = ''.obs;
  RxBool isDataSet = false.obs;

  getAndSetProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('name') ?? '';
    profilePicture.value = prefs.getString('profilePicture')?? '';
    isDataSet.value = true;
  }
}
