import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  CustomOutlinedButton(
      {super.key,
      required this.deviceSize,
      required this.title,
      required this.onTap});

  final Size deviceSize;
  String title;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(
            left: deviceSize.width / 46, right: deviceSize.width / 46),
        child: TextButton(
          onPressed: onTap,
          style: TextButton.styleFrom(
              foregroundColor: Color(0xFF252525),
              textStyle: GoogleFonts.lexend(
                  fontSize: MediaQuery.of(context).devicePixelRatio * 5.6),
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

class OutlineButtonIssueType extends StatelessWidget {
  const OutlineButtonIssueType(
      {super.key,
      required this.deviceSize,
      required this.title,
      required this.onTap,
      required this.isSelected});

  final Size deviceSize;
  final String title;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: deviceSize.width / 60, vertical: deviceSize.height / 150),
      child: Expanded(
        child: InkWell(
          onTap: onTap,
          child: Container(
            width: deviceSize.width / 3.8,
            height: 34.0,
            decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.circular(5.0), // Set circular radius to 5
              border: Border.all(color: Colors.black, width: 1.0),
              color: isSelected ? AppColors.black : AppColors.white,
            ),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    color: isSelected ? Colors.white : AppColors.black),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
