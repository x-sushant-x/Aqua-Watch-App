import 'package:aqua_watch_app/controllers/authentication/google_auth.dart';
import 'package:aqua_watch_app/view/authentication/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                height: h * 0.5,
                width: w,
                color: Color.fromARGB(255, 66, 66, 66),
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
                      Container(
                        width: w * 0.85,
                        child: Text(
                          "Welcome back! Let's \nLog In",
                          style: GoogleFonts.lexend(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500)),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                          height: h * 0.1,
                          width: w * 0.85,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 1.0, color: Colors.grey.shade500),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              signInWithGoogle();
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(h * 0.07),
                              backgroundColor: Color.fromARGB(
                                  255, 37, 37, 37), // Background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 16),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 16,
                                  width: 16,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/signup/Google.png"),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                    width: 8), // Adjust the spacing as needed
                                Text(
                                  "Log In With Google",
                                  style: GoogleFonts.lexend(
                                    textStyle: TextStyle(
                                        fontSize: 13, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          )),
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
                                Navigator.pop(context);
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
