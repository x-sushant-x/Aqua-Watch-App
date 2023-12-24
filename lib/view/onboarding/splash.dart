import 'package:aqua_watch_app/view/authentication/ngo_register.dart';
import 'package:aqua_watch_app/controllers/splash/splash_controller.dart';
import 'package:aqua_watch_app/utils/buttons.dart';
import 'package:aqua_watch_app/view/authentication/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget bottomSheetBuilder(BuildContext context) {
  Size deviceSize = MediaQuery.of(context).size;

  return SizedBox(
    child: Container(
      height: deviceSize.height / 4.5,
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            width: deviceSize.width / 5,
            height: 5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.shade900),
          ),
          SizedBox(height: deviceSize.height / 30),
          Padding(
            padding: EdgeInsets.only(
                top: deviceSize.height / 1000,
                left: deviceSize.width / 22,
                bottom: deviceSize.height / 30),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Choose Your Side",
                style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w500,
                    fontSize: MediaQuery.of(context).devicePixelRatio * 8),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: deviceSize.width / 46),
            child: Row(
              children: [
                CustomOutlinedButton(
                  deviceSize: deviceSize,
                  title: "NGOs",
                  onTap: () {
                    Get.to(sign_up_ngo());
                  },
                ),
                CustomOutlinedButton(
                  deviceSize: deviceSize,
                  title: "Citizen",
                  onTap: () {
                    Get.to(sign_up());
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: deviceSize.height / 100),
        ],
      ),
    ),
  );
}

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SplashController.isLoggedIn();
  }

  clearLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    print("Prefs Cleared");
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: deviceSize.width / 30,
                vertical: deviceSize.height / 30),
            child: Row(
              children: [
                Icon(
                  Icons.water_drop,
                  color: Colors.blue.shade700,
                  size: 28,
                ),
                SizedBox(width: 10),
                Text(
                  "Aqua Watch",
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600,
                    fontSize: 28,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: 0,
                left: deviceSize.width / 25,
                right: deviceSize.width / 25,
                bottom: 0),
            child: Image.asset(
              "assets/splashimage.png",
              height: deviceSize.height / 2.5,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: deviceSize.width / 30,
                right: deviceSize.width / 30,
                top: deviceSize.height / 1000,
                bottom: deviceSize.height / 18),
            child: Text.rich(TextSpan(
                style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).devicePixelRatio * 14.2),
                children: const [
                  TextSpan(text: "An app for all your "),
                  TextSpan(text: "water", style: TextStyle(color: Colors.blue)),
                  TextSpan(text: " related problems!")
                ])),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: deviceSize.height / 60, left: deviceSize.width / 25),
            child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: bottomSheetBuilder,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))));
                  },
                  child: Container(
                    width: deviceSize.width / 3.5,
                    height: deviceSize.height / 20,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(6)),
                    child: Center(
                      child: Text(
                        "Start",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                )),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    top: deviceSize.height / 60,
                    bottom: deviceSize.height / 90),
                child: Text.rich(TextSpan(
                    style: GoogleFonts.lexend(
                        fontSize:
                            MediaQuery.of(context).devicePixelRatio * 5.5),
                    children: const [
                      TextSpan(text: "Developed with "),
                      TextSpan(text: "❤️", style: TextStyle(color: Colors.red)),
                      TextSpan(text: " By "),
                      TextSpan(
                          text: "Cyber Crew",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ])),
              ),
            ),
          )
        ],
      )),
    );
  }
}
