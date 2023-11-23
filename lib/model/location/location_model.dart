import 'package:get/state_manager.dart';

class PiLoc {
  late final String state;
  final String locality;
  final String postalCode;
  final String road;

  PiLoc({
    required this.state,
    required this.locality,
    required this.postalCode,
    required this.road,

  });
}