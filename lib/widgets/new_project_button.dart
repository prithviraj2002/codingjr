import 'package:coding_junior_assignment/constants/colors/assignment-colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewProjectButton extends StatelessWidget {
  String text;
  Icon icon;
  double height;
  double width;
  NewProjectButton({required this.text, required this.icon, this.height = 50, this.width = 200, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(12.0),
        color: AppColors.newProjectButtonBG
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          icon,
          const SizedBox(width: 4,),
          Text(text, style: GoogleFonts.comfortaa(color: AppColors.primaryBlue, fontSize: 16, fontWeight: FontWeight.bold,),),
        ],
      ),
    );
  }
}
