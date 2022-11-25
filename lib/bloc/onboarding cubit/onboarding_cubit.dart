import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
      : super(OnboardingInitial(pageIndex: 0));

  setPage(int page) {
    switch (page) {
      case 0:
        return emit(OnboardingInitial(pageIndex: page));
      case 1:
        return emit(OnboardingInitial(pageIndex: page));
      case 2:
        return emit(OnboardingInitial(pageIndex: page));
    }
  }
}
