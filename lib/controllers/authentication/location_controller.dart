import 'package:aqua_watch_app/model/location/location_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LocationController extends GetxController {
  final placemarks = <PiLoc>[].obs;
  List<Placemark> placemark = <Placemark>[];
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getUserLocation();
  }

  Future<bool> checkPermission() async {
    bool serviceEnabled = false;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  getUserLocation() async {
    var serviceEnabled = await checkPermission();
    if (serviceEnabled) {
      Position location = await Geolocator.getCurrentPosition();
      placemark =
          await placemarkFromCoordinates(location.latitude, location.longitude);

      Placemark first = placemark.first;

      final fetchedData = [
        PiLoc(
          state: first.subAdministrativeArea.toString(),
          locality: first.subAdministrativeArea.toString(),
          postalCode: first.postalCode.toString(),
          road: first.thoroughfare.toString(),
        )
      ];

      placemarks.value = fetchedData;
      isLoading.value = false;

      print('State: ${placemarks.first.state}');
      print('Locality: ${first.toString()}');
      print('Postal Code: ${first.postalCode}');
      print('Road: ${first.thoroughfare}');
    } else {
      isLoading.value = false;
      final fetchedData = [
        PiLoc(
          state: "",
          locality: "",
          postalCode: "",
          road: "",
        )
      ];

      placemarks.value = fetchedData;
    }
  }

  Future<String> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks.first;

      String address =
          "${place.name}, ${place.locality}";
      return address;
    } catch (e) {
      return "Could not get address for the location";
    }
  }
}
