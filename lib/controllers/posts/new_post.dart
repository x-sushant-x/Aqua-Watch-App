import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageOrCameraController extends GetxController {
  Future<XFile?>? crossfile;
}

class NewPostController extends GetxController {
  newPost() async {
    var i = await askForImageOrCamera();
    print(i?.path);


  }

  Future<XFile?> askForImageOrCamera() async {
    var imageOrCameraController = Get.put(ImageOrCameraController());
    final ImagePicker picker = ImagePicker();
    Get.bottomSheet(
      
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Colors.white
        ),
        child: SizedBox(
          
          width: Get.width,
          child: Column(
            
            children: [
              ListTile(title: Text("Gallery"), leading: Icon(Icons.image), onTap: () {imageOrCameraController.crossfile = picker.pickImage(source: ImageSource.gallery);},),
              ListTile(title: Text("Camera"), leading: Icon(Icons.camera_alt), onTap: () {imageOrCameraController.crossfile = picker.pickImage(source: ImageSource.camera);})
            ],
          ),
        ),
      ),
      
    );
    return imageOrCameraController.crossfile;
  }
}