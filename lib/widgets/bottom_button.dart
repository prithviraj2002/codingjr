import 'package:coding_junior_assignment/constants/colors/assignment-colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomButton extends StatelessWidget {
  String text;
  double height;
  double width;
  BottomButton({required this.text, this.height = 50, this.width = 85, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColors.bottomButtonBG,
        borderRadius: BorderRadius.circular(16)
      ),
      child: Center(child: Text(text, style: GoogleFonts.comfortaa(color: Colors.black),)),
    );
  }
}
