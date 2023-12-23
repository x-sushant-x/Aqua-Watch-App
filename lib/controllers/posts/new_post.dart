import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_core/firebase_core.dart';

class ImageOrCameraController extends GetxController {
  Future<XFile?>? crossfile;
}

class NewPostController extends GetxController {
  
  newPost() async {
    
    Firebase.initializeApp();
    var cloudStorageRef = FirebaseStorage.instance.ref();
    var imageOrCameraController = Get.put(ImageOrCameraController());

    XFile? xfile = await imageOrCameraController.crossfile;

    late Future<String> downloadURL;
    
    // Image should exist
    if (xfile != null) {
      // Generate a unique name for image
      String imageUuid = Uuid().v6();
      var cloudImageRef = cloudStorageRef.child(imageUuid+"."+xfile.name.split(".")[-1]);
      var imgData = await xfile.readAsBytes();
      var imgMeta = SettableMetadata(contentType: xfile.mimeType);
      var task = cloudImageRef.putData(imgData, imgMeta);
      task.then((p0) {
        downloadURL = cloudImageRef.getDownloadURL().then((value) {
          print(value);
          return value;
        });
      });
      // TODO: now the downloadURL is stored as a future in downloadURL variable, and it should be used in API
    } else {
      // TODO: show a dialog that user has not selected a picture
    }


  }

  Future<XFile?> askForImageOrCamera() async {
    var imageOrCameraController = Get.put(ImageOrCameraController());
    final ImagePicker picker = ImagePicker();
    Get.bottomSheet(
      
      SizedBox(
          
          width: Get.width,
          child: Column(
            
            children: [
              ListTile(title: Text("Gallery"), leading: Icon(Icons.image), onTap: () {imageOrCameraController.crossfile = picker.pickImage(source: ImageSource.gallery);Get.back();},),
              ListTile(title: Text("Camera"), leading: Icon(Icons.camera_alt), onTap: () {imageOrCameraController.crossfile = picker.pickImage(source: ImageSource.camera);Get.back();})
            ],
          ),
        ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)))
    );
    return imageOrCameraController.crossfile;
  }
}