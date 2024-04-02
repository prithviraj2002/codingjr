import 'package:coding_junior_assignment/constants/colors/assignment-colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LangCard extends StatelessWidget {
  Icon icon;
  String name;
  double height;
  double width;
  LangCard({required this.name, required this.icon,  this.height = 100, this.width = 150, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryBlue),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Center(
          child: Column(
            children: [
              icon,
              Text(
                name, style: GoogleFonts.comfortaa(textStyle: TextStyle(color: AppColors.primaryBlue, fontSize: 20)),),
            ],
          )),
    );
  }
}
