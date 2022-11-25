import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sputnik_test/bloc/models%20cubit/models_cubit.dart';
import 'package:sputnik_test/constants/colors.dart';

class FollowersPage extends StatelessWidget {
  const FollowersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModelsCubit, ModelsState>(
      builder: (context, state) {
        if (state is ModelsInitial) {
          return SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Followers',
                      style: GoogleFonts.poppins(
                          color: CustomColors.darkGray,
                          fontSize: 34,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 205, 205, 205),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Searh...', style: GoogleFonts.poppins(color: CustomColors.a1a1a1, fontSize: 17),),
                          SvgPicture.asset('assets/svg/filter.svg')
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  state.followersModel.isNotEmpty?ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: state.followersModel.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const Divider(
                            color: CustomColors.aeaeb2,
                            height: 1.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundImage: NetworkImage(state.followersModel[index].avatarUrl)
                                ),
                                const SizedBox(width: 12,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(state.followersModel[index].login, style:GoogleFonts.poppins(color: CustomColors.darkGray, fontSize: 20, fontWeight: FontWeight.w700,)),
                                    Text(state.followersModel[index].id.toString(), style:GoogleFonts.poppins(color: CustomColors.f4f4f4, fontSize: 17, fontWeight: FontWeight.w500,)),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ):const SizedBox(),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
