import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget bottomSheetBuilder(BuildContext context) {
  Size deviceSize = MediaQuery.of(context).size;

  return SizedBox(
    height: deviceSize.height / 5,
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: deviceSize.height / 1000,
              left: deviceSize.width / 17,
              bottom: deviceSize.height / 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Choose Your Side",
              style: GoogleFonts.lexend(
                  fontWeight: FontWeight.w500,
                  fontSize: MediaQuery.of(context).devicePixelRatio * 18),
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: deviceSize.width / 23, right: deviceSize.width / 46),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: GoogleFonts.lexend(
                          fontSize:
                              MediaQuery.of(context).devicePixelRatio * 12),
                      minimumSize: Size(20, 40),
                      maximumSize: Size(40, 40),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.4),
                          borderRadius: BorderRadius.circular(5))),
                  child: Text("Ministry"),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: deviceSize.width / 46, right: deviceSize.width / 46),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: GoogleFonts.lexend(
                          fontSize:
                              MediaQuery.of(context).devicePixelRatio * 12),
                      minimumSize: Size(20, 40),
                      maximumSize: Size(40, 40),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.4),
                          borderRadius: BorderRadius.circular(5))),
                  child: Text("NGOs"),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                    left: deviceSize.width / 46, right: deviceSize.width / 23),
                child: TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      textStyle: GoogleFonts.lexend(
                          fontSize:
                              MediaQuery.of(context).devicePixelRatio * 12),
                      minimumSize: Size(20, 40),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1.4),
                          borderRadius: BorderRadius.circular(5))),
                  child: Text("User"),
                ),
              ),
            )
          ],
        )
      ],
    ),
  );
}

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: deviceSize.height / 6000),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage("assets/app icon.png"),
                  color: Colors.blue,
                  size: deviceSize.width * 0.18,
                ),
                Text(
                  "Aqua Watch",
                  style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).devicePixelRatio * 20,
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
                left: deviceSize.width / 18,
                right: deviceSize.width / 18,
                top: deviceSize.height / 40,
                bottom: deviceSize.height / 18),
            child: Text.rich(TextSpan(
                style: GoogleFonts.lexend(
                    fontWeight: FontWeight.w600,
                    fontSize: MediaQuery.of(context).devicePixelRatio * 25),
                children: const [
                  TextSpan(text: "An app for all your "),
                  TextSpan(text: "water", style: TextStyle(color: Colors.blue)),
                  TextSpan(text: " related problems!")
                ])),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: deviceSize.height / 60, left: deviceSize.width / 18),
            child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        builder: bottomSheetBuilder,
                        showDragHandle: true,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))));
                  },
                  style: TextButton.styleFrom(
                      minimumSize:
                          Size(deviceSize.width / 3, deviceSize.height / 16),
                      backgroundColor: Color(0xFF252525),
                      foregroundColor: Colors.white,
                      textStyle: GoogleFonts.lexend(
                          fontSize:
                              MediaQuery.of(context).devicePixelRatio * 12)),
                  child: Text(
                    "Start",
                    style: GoogleFonts.lexend(),
                  ),
                )),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: deviceSize.height / 60),
                child: Text.rich(TextSpan(
                    style: GoogleFonts.lexend(
                        fontSize: MediaQuery.of(context).devicePixelRatio * 12),
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
