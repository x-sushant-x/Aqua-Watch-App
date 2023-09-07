import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  fontSize: MediaQuery.of(context).devicePixelRatio * 10),
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
                      foregroundColor: Color(0xFF252525),
                      textStyle: GoogleFonts.lexend(
                          fontSize:
                              MediaQuery.of(context).devicePixelRatio * 7),
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
                      foregroundColor: Color(0xFF252525),
                      textStyle: GoogleFonts.lexend(
                          fontSize:
                              MediaQuery.of(context).devicePixelRatio * 7),
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
                      foregroundColor: Color(0xFF252525),
                      textStyle: GoogleFonts.lexend(
                          fontSize:
                              MediaQuery.of(context).devicePixelRatio * 7),
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
                    fontSize: MediaQuery.of(context).devicePixelRatio * 11,
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
                          Size(deviceSize.width / 3, deviceSize.height / 20),
                      backgroundColor: Color(0xFF252525),
                      foregroundColor: Colors.white,
                      textStyle: GoogleFonts.lexend(
                          fontSize:
                              MediaQuery.of(context).devicePixelRatio * 7.5)),
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
