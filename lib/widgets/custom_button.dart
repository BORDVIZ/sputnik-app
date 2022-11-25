import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sputnik_test/constants/colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, required this.onTap, this.enable=false});
  final String text;
  final Function() onTap;
  bool enable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: enable?CustomColors.enable:CustomColors.orangeGradient,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextButton(
        onPressed: enable?(){}:onTap,
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            )),
        child: Text(
          text,
          style: GoogleFonts.poppins(
              color: CustomColors.buttonText,
              fontSize: 17,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
