import 'package:aqua_watch_app/controllers/authentication/api.dart';
import 'package:aqua_watch_app/controllers/authentication/dropdown_controller.dart';
import 'package:aqua_watch_app/controllers/authentication/location_controller.dart';
import 'package:aqua_watch_app/controllers/authentication/google_auth.dart';
import 'package:aqua_watch_app/screens/home_page.dart';
import 'package:aqua_watch_app/utils/snackbar.dart';
import 'package:aqua_watch_app/view/authentication/log_in.dart';
import 'package:aqua_watch_app/view/authentication/sign_up_next.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';

class sign_up extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());
  final DropdownController dropdownController = Get.put(DropdownController());
  final TextEditingController locationTextController = TextEditingController();
  final TextEditingController phoneTextController = TextEditingController();

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
            Column(mainAxisAlignment: MainAxisAlignment.end, children: [
              Container(
                height: h * 0.3,
                width: w,
                color: Color.fromARGB(255, 66, 66, 66),
              ),
            ]),
            Container(
              padding: EdgeInsets.only(right: w * 0.1, left: w * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Let's start with account\ncreation!",
                          style: GoogleFonts.lexend(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500))),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: h * 0.6,
                        width: w * 0.90,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 1.0, color: Colors.grey.shade500),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GetX<LocationController>(
                                init: locationController,
                                builder: (locationcontroller) {
                                  RxBool Isloading =
                                      locationController.isLoading;
                                  if (Isloading.value) {
                                    return TextField(
                                      controller: locationTextController,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.location_on,
                                          color: Colors.grey.shade600,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        labelText: 'Fetching Location ......',
                                      ),
                                      style: GoogleFonts.lexend(),
                                    );
                                  } else {
                                    locationTextController.text =
                                        locationcontroller
                                            .placemarks.first.locality;
                                    return Column(
                                      children: [
                                        TextField(
                                          controller: locationTextController,
                                          decoration: InputDecoration(
                                            suffixIcon: Icon(
                                              Icons.location_on,
                                              color: Colors.grey.shade600,
                                            ),
                                            suffixIconConstraints:
                                                BoxConstraints(
                                                    maxHeight: 50,
                                                    minWidth: 50),
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(10))),
                                            labelText: 'Pick Location',
                                          ),
                                          style: GoogleFonts.lexend(),
                                        ),
                                      ],
                                    );
                                  }
                                }),
                            TextFormField(
                              controller: phoneTextController,
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.grey.shade600,
                                ),
                                suffixIconConstraints:
                                    BoxConstraints(maxHeight: 50, minWidth: 50),
                                border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                labelText: 'Phone Number',
                              ),
                              style: GoogleFonts.lexend(),
                            ),
                            FormField<String>(
                              builder: (FormFieldState<String> state) {
                                return InputDecorator(
                                  decoration: InputDecoration(
                                    constraints: BoxConstraints(maxHeight: 60),
                                    labelText: 'Prefered Language',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                  ),
                                  baseStyle: GoogleFonts.lexend(),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: Colors.grey.shade600,
                                      ),
                                      value: dropdownController
                                          .selectedValue.value,
                                      onChanged: (String? newValue) {
                                        dropdownController
                                            .updateSelectedValue(newValue!);
                                        state.didChange(newValue);
                                      },
                                      items: <String>[
                                        "English",
                                        "Hindi",
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value,
                                              style: GoogleFonts.lexend()),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Checkbox1(),
                                Expanded(
                                    child: Text(
                                  "By Signing Up you agree to our terms and conditions.",
                                  style: GoogleFonts.lexend(
                                      textStyle: TextStyle(
                                          fontSize: 13,
                                          color:
                                              Color.fromARGB(255, 69, 69, 69))),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (phoneTextController.text.isEmpty ||
                                    locationTextController.text.isEmpty) {
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
                                      phoneTextController.text.toString()
                                      );
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
                                    "Sign Up With Google",
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
                                      builder: (context) => const Login()),
                                );
                              },
                              child: Text("Login",
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

class Checkbox1 extends StatefulWidget {
  const Checkbox1({super.key});

  @override
  State<Checkbox1> createState() => _Checkbox1State();
}

class _Checkbox1State extends State<Checkbox1> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      } else {
        return Colors.white;
      }
    }

    return Checkbox(
      checkColor: Colors.blue,
      side: MaterialStateBorderSide.resolveWith(
        (states) => BorderSide(width: 1.0, color: Colors.grey.shade700),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      fillColor: MaterialStateProperty.resolveWith(getColor),
      value: isChecked,
      onChanged: (bool? value) {
        setState(() {
          isChecked = value!;
        });
      },
    );
  }
}
