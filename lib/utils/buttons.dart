import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlinedButton extends StatelessWidget {
  CustomOutlinedButton({
    super.key,
    required this.deviceSize,
    required this.title
  });

  final Size deviceSize;
  String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            left: deviceSize.width / 23,
            right: deviceSize.width / 46),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              foregroundColor: Color(0xFF252525),
              textStyle: GoogleFonts.lexend(
                  fontSize:
                      MediaQuery.of(context).devicePixelRatio * 5.6),
              minimumSize: Size(20, 40),
              maximumSize: Size(40, 40),
              shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.4),
                  borderRadius: BorderRadius.circular(5))),
          child: Text(title),
        ),
      ),
    );
  }
}