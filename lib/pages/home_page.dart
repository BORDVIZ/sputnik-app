import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sputnik_test/bloc/models%20cubit/models_cubit.dart';
import 'package:sputnik_test/constants/colors.dart';
import 'package:sputnik_test/widgets/loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModelsCubit, ModelsState>(
      builder: (context, state) {
        if (state is ModelsInitial) {
          return Loading(
              value: state.isLoaded,
              child: SafeArea(
                child: ListView(
                  children: [
                    const SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.userModel.name.split(' ')[0],
                            style: GoogleFonts.poppins(
                                color: CustomColors.darkGray,
                                fontSize: 34,
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 13.5, horizontal: 5.35),
                            decoration: BoxDecoration(
                                gradient: CustomColors.orangeGradient,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Follow on github',
                                  style: GoogleFonts.poppins(
                                      color: CustomColors.buttonText,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Company - ${state.userModel.company}',
                            style: GoogleFonts.poppins(
                                color: CustomColors.b0b0b0,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Email - ${state.userModel.email}',
                            style: GoogleFonts.poppins(
                                color: CustomColors.b0b0b0,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            'Bio - ${state.userModel.bio}',
                            style: GoogleFonts.poppins(
                                color: CustomColors.b0b0b0,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                      child: Divider(
                        color: CustomColors.aeaeb2,
                        height: 1.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Following you',
                            style: GoogleFonts.poppins(
                                color: CustomColors.darkGray,
                                fontSize: 34,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'View all',
                                style: GoogleFonts.poppins(
                                  color: CustomColors.darkGray,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  decorationColor: CustomColors.darkGray,
                                  decoration: TextDecoration.underline,
                                ),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(height: 18,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        height: 176,
                        child: state.followingModel.isNotEmpty?ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.followingModel.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(state.followingModel[index].avatarUrl),
                                    radius: 60,
                                  ),
                                  Text(state.followingModel[index].login, style: GoogleFonts.poppins(color: CustomColors.darkGray, fontSize: 17, fontWeight: FontWeight.w500),),
                                  Text(state.followingModel[index].id.toString(), style: GoogleFonts.poppins(color: CustomColors.b0b0b0, fontSize: 10, fontWeight: FontWeight.w500),),
                                ],
                              ),
                            );
                          },
                        ):const SizedBox(),
                      ),
                    ),
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 17),
                      child: Divider(
                        color: CustomColors.aeaeb2,
                        height: 1.5,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Repositories',
                            style: GoogleFonts.poppins(
                                color: CustomColors.darkGray,
                                fontSize: 34,
                                fontWeight: FontWeight.w700),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                'View all',
                                style: GoogleFonts.poppins(
                                  color: CustomColors.darkGray,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  decorationColor: CustomColors.darkGray,
                                  decoration: TextDecoration.underline,
                                ),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(height: 18,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SizedBox(
                        height: 176,
                        child: state.repositoriesModel.isNotEmpty?ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.repositoriesModel.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.yellow.shade600,
                                          image: DecorationImage(image: NetworkImage(state.repositoriesModel[index].owner.avatarUrl))
                                        ),
                                      ),
                                      const SizedBox(width: 8,),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                                        decoration: BoxDecoration(
                                          color: CustomColors.e1e1e1,
                                          borderRadius: BorderRadius.circular(7)
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset('assets/svg/star.svg'),
                                            const SizedBox(width: 3,),
                                            Text(state.repositoriesModel[index].stargazersCount.toString(), style: GoogleFonts.poppins(color: CustomColors.yellow, fontSize: 10, fontWeight: FontWeight.w600),)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20,),
                                  Row(
                                    children:  [
                                      Text(state.repositoriesModel[index].name, style: GoogleFonts.poppins(
                                        color: CustomColors.darkGray,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w500),),
                                        const SizedBox(width: 8,),
                                      Container(
                                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                                        decoration: BoxDecoration(
                                          color: CustomColors.darkGray,
                                          borderRadius: BorderRadius.circular(7)
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset('assets/svg/branch.svg'),
                                            const SizedBox(width: 10,),
                                            Text(state.repositoriesModel[index].forksCount.toString(), style: GoogleFonts.poppins(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w500),)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  Text(state.repositoriesModel[index].owner.id.toString(), style: GoogleFonts.poppins(color: CustomColors.b0b0b0, fontSize: 10, fontWeight: FontWeight.w500),),
                                ],
                              ),
                            );
                          },
                        ):const SizedBox(),
                      ),
                    ),
                    const SizedBox(height: 60,)
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
