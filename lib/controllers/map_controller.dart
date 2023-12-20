import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../model/map/map_point.dart';
import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String baseURL = dotenv.env["APIURL"] ?? '';

class MapController extends GetxController {

  // Maintains the reference MapPoint object whose marker is tapped on map
  late MapPoint selectedMapPoint;

    Future<List<MapPoint>> getMapPoints() async {
      final response = await http.get(Uri.parse("$baseURL/post/map"));

      if (response.statusCode == 200) {

        final Map<String, dynamic> data = jsonDecode(response.body);
        final List<dynamic> pointsList = data['data'];

        List<MapPoint> points = pointsList.map((point) => MapPoint.fromJson(point)).toList();
        return points;

      } else {
        throw Exception('Failed to load Map');
      }
    }
}