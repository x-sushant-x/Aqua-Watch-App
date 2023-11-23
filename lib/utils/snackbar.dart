import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

showSnackbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      content: Text(
        message,
        style: GoogleFonts.lexend(
          textStyle:
              TextStyle(fontSize: 15, color: Color.fromARGB(255, 69, 69, 69)),
        ),
      ),
      backgroundColor: Color(0xfff6f6f6),
    ),
  );
}
