import 'package:aqua_watch_app/controllers/splash/splash_controller.dart';
import 'package:aqua_watch_app/screens/home.dart';
import 'package:aqua_watch_app/screens/ngo_dashboard_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:aqua_watch_app/view/onboarding/splash.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await dotenv.load(fileName: "lib/.env");
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
