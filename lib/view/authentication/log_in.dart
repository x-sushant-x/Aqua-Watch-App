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
                color: Colors.black,
              ),
            ]),
            Container(
              padding: EdgeInsets.only(right: w * 0.1, left: w * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Welcome back! Let's \nLog In",
                    style: GoogleFonts.lexend(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500)),
                  ),
                  Column(
                    children: [
                      Container(
                          height: h * 0.09,
                          width: w * 0.85,
                          padding: EdgeInsets.all(13),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 2.0,
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your Google sign-up logic here
                            },
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(h * 0.07),
                              backgroundColor: Colors.black, // Background color
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
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
                                        fontSize: 15, color: Colors.white),
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
                                    fontSize: 18, color: Colors.black),
                              )),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("Sign Up",
                                  style: GoogleFonts.lexend(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black),
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
