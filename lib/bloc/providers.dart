import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sputnik_test/bloc/bottom%20bar%20cubit/bottom_bar_cubit.dart';
import 'package:sputnik_test/bloc/models%20cubit/models_cubit.dart';
import 'package:sputnik_test/bloc/onboarding%20cubit/onboarding_cubit.dart';
import 'package:sputnik_test/bloc/sing%20in%20cubit/sing_in_cubit.dart';

class Providers {
  static final List<BlocProvider> providers = [
    BlocProvider<OnboardingCubit>(create: (_)=>OnboardingCubit()),
    BlocProvider<SingInCubit>(create: (_)=>SingInCubit(),),
    BlocProvider<ModelsCubit>(create: (_)=>ModelsCubit(),),
    BlocProvider<BottomBarCubit>(create: (_)=>BottomBarCubit(),),
  ];
}
