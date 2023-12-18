import 'dart:convert';
import 'package:aqua_watch_app/controllers/dialogs/dialog_controller.dart';
import 'package:aqua_watch_app/model/post/post.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json'
};

String baseURL = dotenv.env["APIURL"] ?? '';

class PostController extends GetxController {
  final dialogController = Get.put(DialogsController());

  var city = "".obs;

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseURL/post'), headers: requestHeaders);
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> eventList = data['posts'];
      List<Post> events =
          eventList.map((event) => Post.fromJson(event)).toList();
      return events;
    } else {
      throw Exception('Failed to load events');
    }
  }

  Future<List<Post>> fetchPostsByCity(String city) async {

    // https://api.flutter.dev/flutter/dart-core/Uri/encodeQueryComponent.html
    // encodeQueryComponent is used to properly escape city names having spaces
    Uri baseUri = Uri.parse('$baseURL/post/search?city=${Uri.encodeQueryComponent(city)}');

    final response = await http.get(baseUri, headers: requestHeaders);
    
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> eventList = data['data'];
      List<Post> events =
          eventList.map((event) => Post.fromJson(event)).toList();
      print(events);
      return events;
      
    } else {
      throw Exception('Failed to load events');
    }
  }

  // Performs search by changing the observed list of post objects
  void performSearch(String query) async {
    city.value = query;
  }



  Future<bool> likePost(String postID) async {
    try {
      var response = await http.post(Uri.parse('$baseURL/user?postId=$postID'), headers: requestHeaders);
      if(response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
      
    } catch (err) {
      return false;
    }
  }
}
