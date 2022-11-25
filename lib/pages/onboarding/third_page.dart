import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sputnik_test/constants/colors.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Container(
              width: 120,
              padding: const EdgeInsets.only(left: 39),
              child:
                  Image.asset('assets/images/logo.png', fit: BoxFit.fitWidth)),
          Positioned(
            bottom: 22,
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.asset('assets/images/ob3.png',
                        fit: BoxFit.fitWidth)),
                const SizedBox(height: 103,),
                Text('Сделано ботаниками для\nботаников',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        color: CustomColors.obText,
                        fontSize: 22,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          )
        ],
      ),
    );
  }
}