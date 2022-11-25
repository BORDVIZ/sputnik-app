import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sputnik_test/bloc/onboarding%20cubit/onboarding_cubit.dart';
import 'package:sputnik_test/constants/colors.dart';
import 'package:sputnik_test/pages/onboarding/first_page.dart';
import 'package:sputnik_test/pages/onboarding/second_page.dart';
import 'package:sputnik_test/pages/onboarding/third_page.dart';
import 'package:sputnik_test/pages/sign%20in/sign_in_page.dart';
import 'package:sputnik_test/widgets/custom_button.dart';

class OnboardingMain extends StatefulWidget {
  const OnboardingMain({super.key});

  @override
  State<OnboardingMain> createState() => _OnboardingMainState();
}

class _OnboardingMainState extends State<OnboardingMain>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.index = 0;
    _tabController.addListener(_handlerTabSection);
  }

  void _handlerTabSection() {
    BlocProvider.of<OnboardingCubit>(context).setPage(_tabController.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OnboardingCubit, OnboardingState>(
        builder: (context, state) {
          if (state is OnboardingInitial) {
            _tabController.index = state.pageIndex;
            return SafeArea(
              child: Column(
                children: [
                  Expanded(
                      child: TabBarView(
                    controller: _tabController,
                    children: const [FirstPage(), SecondPage(), ThirdPage()],
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 122, vertical: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Dot(
                            selected: state.pageIndex == 0 ? true : false,
                            text: '1'),
                        Dot(
                            selected: state.pageIndex == 1 ? true : false,
                            text: '2'),
                        Dot(
                            selected: state.pageIndex == 2 ? true : false,
                            text: '3'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: CustomButton(
                        text: 'Next',
                        onTap: () {
                          if (_tabController.index < 2) {
                            BlocProvider.of<OnboardingCubit>(context)
                                .setPage(state.pageIndex + 1);
                            _tabController.index += 1;
                          } else {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const SignInPage()));
                          }
                        }),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key, required this.selected, required this.text});
  final bool selected;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          color: selected ? Colors.white : CustomColors.gray,
          borderRadius: BorderRadius.circular(30)),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
              color: selected ? Colors.black : CustomColors.dotColor,
              fontSize: 13,
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
