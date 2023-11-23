import 'package:get/get.dart';

class DropdownController extends GetxController {
  var selectedValue = "English".obs; // Initial selected value, change it as needed

  void updateSelectedValue(String newValue) {
    selectedValue.value = newValue;
  }
}