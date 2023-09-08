import 'package:aqua_watch_app/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:aqua_watch_app/view/onboarding/splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.lexendTextTheme()),
        home: SplashPage()
        // routes: const {
        //  "/": SplashPage(),
        // },
        );
  }
}
