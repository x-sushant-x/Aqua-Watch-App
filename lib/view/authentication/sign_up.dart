import 'package:aqua_watch_app/controllers/authentication/dropdown_controller.dart';
import 'package:aqua_watch_app/controllers/authentication/google_auth.dart';
import 'package:aqua_watch_app/controllers/authentication/location_controller.dart';
import 'package:aqua_watch_app/view/authentication/log_in.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class sign_up extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());
  final DropdownController dropdownController = Get.put(DropdownController());
  final TextEditingController PickLocController = TextEditingController();
  final TextEditingController PhoneNumController = TextEditingController();

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
                color: Colors.black,
              ),
            ]),
            Container(
              padding: EdgeInsets.only(right: w * 0.1, left: w * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Let's start with account\ncreation!",
                      style: GoogleFonts.lexend(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500))),
                  Column(
                    children: [
                      Container(
                        height: h * 0.6,
                        width: w * 0.85,
                        padding: EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                            ),
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
                                      controller: PickLocController,
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(
                                          Icons.location_on,
                                          color: Colors.grey.shade600,
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10))),
                                        labelText: 'Pick Location',
                                      ),
                                      style: GoogleFonts.lexend(),
                                    );
                                  } else {
                                    PickLocController.text = locationcontroller
                                        .placemarks.first.locality;
                                    return Column(
                                      children: [
                                        TextField(
                                          controller: PickLocController,
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
                              controller: PhoneNumController,
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
                                  style: GoogleFonts.lexend(),
                                ))
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (PhoneNumController.text.isEmpty ||
                                    PickLocController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      duration: Duration(seconds: 2),
                                      content: Text(
                                        'Please enter above details',
                                        style: GoogleFonts.lexend(
                                          textStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                        ),
                                      ),
                                      backgroundColor: Color(0xfff6f6f6),
                                    ),
                                  );
                                } else {
                                  signInWithGoogle();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size.fromHeight(h * 0.07),
                                backgroundColor:
                                    Colors.black, // Background color
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
                                    "Sign Up With Google",
                                    style: GoogleFonts.lexend(
                                      textStyle: TextStyle(
                                          fontSize: 15, color: Colors.white),
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
                                    fontSize: 18, color: Colors.black)),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Login()),
                                );
                              },
                              child: Text(
                                "Login",
                                style: GoogleFonts.lexend(
                                    textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black)),
                              ))
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
