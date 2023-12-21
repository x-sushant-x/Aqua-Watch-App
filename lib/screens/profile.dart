import 'package:aqua_watch_app/controllers/profile/profile_controller.dart';
import 'package:aqua_watch_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final profileController = Get.put(ProfileController());

  @override
  void initState() {
    super.initState();
    profileController.getAndSetProfileData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.white2,
        body: Obx(() => profileController.isDataSet == false
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: Get.height / 30),
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                            backgroundImage: NetworkImage(profileController
                                    .profilePicture.isEmpty
                                ? 'https://api.dicebear.com/7.x/avataaars/svg?seed=Coco'
                                : profileController.profilePicture.toString()),
                            maxRadius: 50),
                        SizedBox(height: Get.height / 50),
                        Text(
                          profileController.name.toString(),
                          style: TextStyle(
                              color: AppColors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(height: Get.height / 50),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: Get.width / 4.5,
                            height: Get.height / 25,
                            decoration: BoxDecoration(
                                color: AppColors.white2,
                                border: Border.all(
                                    color: AppColors.black, width: 1),
                                borderRadius: BorderRadius.circular(6)),
                            child: Center(
                                child: Text(
                              'Edit Profile',
                              style: TextStyle(
                                color: AppColors.black,
                                fontSize: 12,
                              ),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: Get.height / 20),
                  Container(
                    width: Get.width / 1.1,
                    height: Get.height / 3.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.grey.withOpacity(0.3),
                            spreadRadius: 0.1,
                            blurRadius: 1,
                            offset: Offset(0, 0),
                          ),
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(Get.width / 15),
                      child: Column(
                        children: [
                          MenuButton(
                            title: 'Check For Updates',
                            color: AppColors.black,
                            showArrow: true,
                          ),
                          MenuButton(
                              title: 'Contact Us',
                              color: AppColors.black,
                              showArrow: true),
                          MenuButton(
                              title: 'About This App',
                              color: AppColors.black,
                              showArrow: true),
                          SizedBox(height: Get.height / 50),
                          MenuButton(
                              title: 'Log Out',
                              color: Colors.red,
                              showArrow: false),
                        ],
                      ),
                    ),
                  )
                ],
              )));
  }
}

class MenuButton extends StatelessWidget {
  MenuButton(
      {super.key,
      required this.title,
      required this.color,
      required this.showArrow});

  String title;
  Color color;
  bool showArrow;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.width / 100),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(color: color, fontSize: 15),
          ),
          showArrow ? Icon(Icons.arrow_right, size: 35) : Container()
        ],
      ),
    );
  }
}
