import 'package:aqua_watch_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogsController extends GetxController {

  showLoadingDialog([String? title]) {
    Get.defaultDialog(
        title: title ?? 'Loading...',
        content: CircularProgressIndicator(color: AppColors.black),
        titleStyle: TextStyle(color: AppColors.black, fontFamily: 'Lexend'),
        titlePadding: const EdgeInsets.all(16),
        barrierDismissible: false);
  }

  hideDialog() {
    if (Get.isDialogOpen == true) {
      Get.back();
    }
  }

  showErrorDialog([String? title, String? message, Function()? onTap]) {
    Get.defaultDialog(
      title: title ?? 'Something went wrong!',
      middleText: message ??
          'There was some problem while processing your request.',
      titlePadding: const EdgeInsets.all(16),
      contentPadding:
          const EdgeInsets.only(bottom: 26, top: 8, left: 8, right: 8),
      cancel: InkWell(
        onTap: onTap ??
            () {
              Get.back();
            },
        child: Container(
          width: Get.width / 4,
          height: Get.height / 25,
          decoration: BoxDecoration(
              color: Colors.redAccent, borderRadius: BorderRadius.circular(10)),
          child: const Center(
            child: Text('Okay',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
          ),
        ),
      ),
    );
  }
}