import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sputnik_test/bloc/onboarding%20cubit/onboarding_cubit.dart';
import 'package:sputnik_test/bloc/sing%20in%20cubit/sing_in_cubit.dart';
import 'package:sputnik_test/constants/colors.dart';
import 'package:sputnik_test/pages/sign%20in/search_user.dart';
import 'package:sputnik_test/widgets/custom_button.dart';
import 'package:sputnik_test/widgets/loading.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return BlocBuilder<SingInCubit, SingInState>(
      builder: (context, state) {
        if (state is SingInInitial) {
          return Scaffold(
            body: Loading(
              value: state.isLoading,
              child: SafeArea(
                child: SizedBox(
                  width: double.infinity,
                  child: GestureDetector(
                    onTap: () => FocusScope.of(context).unfocus(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: IconButton(
                            onPressed: () {
                              BlocProvider.of<OnboardingCubit>(context)
                                  .setPage(0);
                              Navigator.pop(context);
                            },
                            icon: SvgPicture.asset('assets/svg/back.svg'),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text('GitHub social',
                              style: GoogleFonts.poppins(
                                  color: CustomColors.obText,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text('Enter nickname on github',
                              style: GoogleFonts.poppins(
                                  color: CustomColors.lightGray,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500)),
                        ),
                        const SizedBox(
                          height: 46,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: SearchUser(
                            controller: controller,
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 40),
                              child: state.error
                                  ? Column(
                                      children: [
                                        SvgPicture.asset('assets/svg/error.svg'),
                                        Text(
                                          'User with this nickname\nnot found!',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.poppins(
                                              color: CustomColors.red,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ],
                                    )
                                  : const SizedBox(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CustomButton(
                            onTap: () {
                              BlocProvider.of<SingInCubit>(context)
                                  .searchUser(controller.text, context);
                            },
                            text: 'Search',
                            enable: state.enable,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'By signing in, I agree with ',
                                    style: GoogleFonts.poppins(
                                        color: CustomColors.b0b0b0,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Terms of Use',
                                    style: GoogleFonts.poppins(
                                        color: CustomColors.darkGray,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'and ',
                                    style: GoogleFonts.poppins(
                                        color: CustomColors.b0b0b0,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    'Privacy Policy',
                                    style: GoogleFonts.poppins(
                                        color: CustomColors.darkGray,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
