import 'package:aqua_watch_app/controllers/authentication/google_auth.dart';
import 'package:aqua_watch_app/view/authentication/ngo_login.dart';
import 'package:aqua_watch_app/view/authentication/ngo_register.dart';
import 'package:aqua_watch_app/view/authentication/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/authentication/google_auth.dart';

class NGOAuth extends StatefulWidget {
  const NGOAuth({Key? key}) : super(key: key);

  @override
  State<NGOAuth> createState() => _NGOAuthState();
}

class _NGOAuthState extends State<NGOAuth> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(elevation: 0, backgroundColor: Color(0xfff6f6f6)),
        backgroundColor: Color(0xfff6f6f6),
        body: Stack(
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                height: h,
                width: w,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/NGO Auth transparent.png"))),
              ),
            ]),
            Container(
              padding: EdgeInsets.only(right: w * 0.1, left: w * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: [
                      SizedBox(
                        width: w * 0.85,
                        child: Text(
                          "Welcome NGO! Let's \nLogin",
                          style: GoogleFonts.lexend(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: h * 0.3,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/NGO_Logo.png"))),
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.47,
                      ),
                      Container(
                        width: w * 0.33,
                        child: ElevatedButton(
                          onPressed: () {
                            signInNGOWithGoogle();
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.fromHeight(h * 0.06),

                            backgroundColor: Color.fromARGB(
                                255, 37, 37, 37), // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Adjust the spacing as needed
                              Text(
                                "Continue",
                                style: GoogleFonts.lexend(
                                  textStyle: TextStyle(
                                      fontSize: 13, color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: w * 0.2,
                      )
                    ],
                  ),
                  Container(
                    height: h * 0.08,
                    width: w * 0.85,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20)),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Don't Have An Account",
                              style: GoogleFonts.lexend(
                                  textStyle: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 69, 69, 69)))),
                          TextButton(
                              onPressed: () {
                               Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => sign_up_ngo()),
                                );;
                              },
                              child: Text("Sign Up",
                                  style: GoogleFonts.lexend(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  )))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
