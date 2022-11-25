import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sputnik_test/bloc/models%20cubit/models_cubit.dart';
import 'package:sputnik_test/constants/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModelsCubit, ModelsState>(
      builder: (context, state) {
        if (state is ModelsInitial) {
          return SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: CustomColors.f0f0f0,
                          borderRadius: BorderRadius.circular(22)
                        ),
                        child: SvgPicture.asset('assets/svg/setting.svg'),
                      ),
                      Container(
                        width: 44,
                        height: 44,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: CustomColors.f0f0f0,
                          borderRadius: BorderRadius.circular(22)
                        ),
                        child: SvgPicture.asset('assets/svg/notif.svg'),
                      )
                    ],
                  ),
                ),
                CircleAvatar(
                  radius: 84,
                  backgroundColor: CustomColors.darkGray,
                  backgroundImage: NetworkImage(state.userModel.avatarUrl)
                ),
                const SizedBox(height: 10,),
                 Text(
                  state.userModel.name,
                  style: GoogleFonts.poppins(
                      color: CustomColors.darkGray,
                      fontSize: 34,
                      fontWeight: FontWeight.w700),
                ),
                Text(state.userModel.id.toString(), style: GoogleFonts.poppins(color: CustomColors.b0b0b0, fontSize: 17, fontWeight: FontWeight.w500),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    margin: const EdgeInsets.only(top: 18),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 19),
                    decoration: BoxDecoration(
                      color: CustomColors.f0f0f0,
                      borderRadius: BorderRadius.circular(14)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/lover.svg'),
                        const SizedBox(width: 13,),
                        Text('My following', style: GoogleFonts.poppins(
                          color: CustomColors.darkGray,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    margin: const EdgeInsets.only(top: 18),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 19),
                    decoration: BoxDecoration(
                      color: CustomColors.f0f0f0,
                      borderRadius: BorderRadius.circular(14)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/lover.svg'),
                        const SizedBox(width: 13,),
                        Text('My followers', style: GoogleFonts.poppins(
                          color: CustomColors.darkGray,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    margin: const EdgeInsets.only(top: 18),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 19),
                    decoration: BoxDecoration(
                      color: CustomColors.f0f0f0,
                      borderRadius: BorderRadius.circular(14)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/medal.svg'),
                        const SizedBox(width: 13,),
                        Text('My badges', style: GoogleFonts.poppins(
                          color: CustomColors.darkGray,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    margin: const EdgeInsets.only(top: 18),
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 19),
                    decoration: BoxDecoration(
                      color: CustomColors.f0f0f0,
                      borderRadius: BorderRadius.circular(14)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/dollar.svg'),
                        const SizedBox(width: 13,),
                        Text('My organizatios', style: GoogleFonts.poppins(
                          color: CustomColors.darkGray,
                          fontSize: 17,
                          fontWeight: FontWeight.w500),),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 18,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: CustomColors.darkGray,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: TextButton(
                      onPressed: (){},
                      style: TextButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          )),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'View all',
                            style: GoogleFonts.poppins(
                                color: CustomColors.buttonText,
                                fontSize: 17,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(width: 10,),
                          SvgPicture.asset('assets/svg/arrow.svg')
                        ],
                      ),
                    ),
                  )
                )
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
