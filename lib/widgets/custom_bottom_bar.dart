import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sputnik_test/bloc/bottom%20bar%20cubit/bottom_bar_cubit.dart';
import 'package:sputnik_test/constants/colors.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        if (state is BottomBarInitial) {
          return Container(
            width: MediaQuery.of(context).size.width,
            color: CustomColors.background,
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BottomButton(
                    icon: 'assets/svg/home.svg',
                    tittle: 'Home',
                    selected: state.pageIndex == 0 ? true : false,
                    onTap: () {
                      BlocProvider.of<BottomBarCubit>(context).setNewValue(0);
                    }),
                BottomButton(
                    icon: 'assets/svg/users.svg',
                    tittle: 'Followers',
                    selected: state.pageIndex == 1 ? true : false,
                    onTap: () {
                      BlocProvider.of<BottomBarCubit>(context).setNewValue(1);
                    }),
                BottomButton(
                    icon: 'assets/svg/chat.svg',
                    tittle: 'Chat',
                    selected: false,
                    onTap: () {}),
                BottomButton(
                    icon: 'assets/svg/profile.svg',
                    tittle: 'Profile',
                    selected: state.pageIndex == 3 ? true : false,
                    onTap: () {
                      BlocProvider.of<BottomBarCubit>(context).setNewValue(3);
                    })
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key,
      required this.icon,
      required this.tittle,
      required this.selected,
      required this.onTap});

  final String icon;
  final String tittle;
  final bool selected;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Column(
        children: [
          SvgPicture.asset(
            icon,
            color: selected ? CustomColors.darkGray : CustomColors.aeaeb2,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            tittle,
            style: GoogleFonts.poppins(
                color: selected ? CustomColors.darkGray : CustomColors.aeaeb2,
                fontSize: 10,
                fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
