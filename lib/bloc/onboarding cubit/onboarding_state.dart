part of 'onboarding_cubit.dart';

@immutable
abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {
  OnboardingInitial({required this.pageIndex});

  int pageIndex;
}
