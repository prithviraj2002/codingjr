import 'package:coding_junior_assignment/constants/colors/assignment-colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RunScreenButtons extends StatelessWidget {
  String text;
  double height;
  double width;
  RunScreenButtons({required this.text, this.height = 50, this.width = 300, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(12.0)
      ),
      child: Center(child: Text(text, style: GoogleFonts.comfortaa(fontSize: 18, color: Colors.white),),),
    );
  }
}
