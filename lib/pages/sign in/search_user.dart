import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sputnik_test/bloc/sing%20in%20cubit/sing_in_cubit.dart';
import 'package:sputnik_test/constants/colors.dart';

class SearchUser extends StatelessWidget {
  const SearchUser({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
          color: CustomColors.f0f0f0, borderRadius: BorderRadius.circular(14)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nickname',
            style: GoogleFonts.poppins(
                color: CustomColors.aeaeb2,
                fontSize: 10,
                fontWeight: FontWeight.w500),
          ),
          TextField(
            controller: controller,
            onChanged: (value) =>
                BlocProvider.of<SingInCubit>(context).setNewValue(value),
            cursorHeight: 42,
            cursorColor: CustomColors.darkGray,
            style: GoogleFonts.poppins(
                color: CustomColors.obText,
                fontSize: 36,
                fontWeight: FontWeight.w500),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                hintText: 'Enter nickname',
                hintStyle: GoogleFonts.poppins(
                    color: CustomColors.b0b0b0,
                    fontSize: 36,
                    fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }
}
