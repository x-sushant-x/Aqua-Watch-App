import 'package:aqua_watch_app/controllers/authentication/api.dart';
import 'package:aqua_watch_app/controllers/authentication/dropdown_controller.dart';
import 'package:aqua_watch_app/controllers/authentication/location_controller.dart';
import 'package:aqua_watch_app/controllers/authentication/google_auth.dart';
import 'package:aqua_watch_app/screens/home_page.dart';
import 'package:aqua_watch_app/utils/snackbar.dart';
import 'package:aqua_watch_app/view/authentication/log_in.dart';
import 'package:aqua_watch_app/view/authentication/ngo_auth.dart';
import 'package:aqua_watch_app/view/authentication/ngo_register.dart';
import 'package:aqua_watch_app/view/authentication/sign_up_next.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';

class ngo_login extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());
  final DropdownController dropdownController = Get.put(DropdownController());
  final TextEditingController locationTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();
  final TextEditingController usernameTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
            elevation: 0, backgroundColor: Color.fromARGB(255, 246, 246, 246)),
        backgroundColor: Color(0xfff6f6f6),
        body: Stack(
          children: [
            Column(children: [
              Container(
                child: Container(
                  height: h * 1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/NGO login transparent.png"),
                          fit: BoxFit.fill)),
                ),
              ),
            ]),
            Container(
              padding: EdgeInsets.only(right: w * 0.1, left: w * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Welcome NGO! Let's Login",
                          style: GoogleFonts.lexend(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold))),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: h * 0.15,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/NGO_Logo.png"))),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: h * 0.43,
                        width: w * 0.90,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1.0, color: Colors.grey.shade500),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("NGO Login Here",
                                    style: GoogleFonts.lexend(
                                        textStyle: TextStyle(
                                            color: Color.fromARGB(255, 0, 0, 0),
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold))),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: usernameTextController,
                              decoration: InputDecoration(
                                suffixIconConstraints:
                                    BoxConstraints(maxHeight: 50, minWidth: 50),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                labelText: "NGO Username",
                              ),
                              style: GoogleFonts.lexend(),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: passwordTextController,
                              decoration: InputDecoration(
                                suffixIconConstraints:
                                    BoxConstraints(maxHeight: 50, minWidth: 50),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                labelText: 'Password',
                              ),
                              style: GoogleFonts.lexend(),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (usernameTextController.text.isEmpty ||
                                    passwordTextController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 2),
                                      content: Text(
                                        'Please enter above details',
                                        style: GoogleFonts.lexend(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 69, 69, 69)),
                                        ),
                                      ),
                                      backgroundColor: Color(0xfff6f6f6),
                                    ),
                                  );
                                } else {
                                  signUpWithGoogle(
                                      locationTextController.text.toString(),
                                      dropdownController.selectedValue
                                          .toString(),
                                      phoneTextController.text.toString());
                                }
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
                                  SizedBox(
                                      width: 8), // Adjust the spacing as needed
                                  Text(
                                    "Continue",
                                    style: GoogleFonts.lexend(
                                      textStyle: TextStyle(
                                          fontSize: 13, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
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
                          Text(
                            "Already have account?",
                            style: GoogleFonts.lexend(
                                textStyle: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 69, 69, 69))),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => sign_up_ngo()),
                                );
                              },
                              child: Text("Sign Up",
                                  style: GoogleFonts.lexend(
                                      textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color:
                                              Color.fromARGB(255, 0, 0, 0)))))
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
