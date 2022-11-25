import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sputnik_test/bloc/bottom%20bar%20cubit/bottom_bar_cubit.dart';
import 'package:sputnik_test/bloc/models%20cubit/models_cubit.dart';
import 'package:sputnik_test/widgets/custom_bottom_bar.dart';

class MainInitial extends StatefulWidget {
  const MainInitial({super.key});

  @override
  State<MainInitial> createState() => _MainInitialState();
}

class _MainInitialState extends State<MainInitial> {
  @override
  void initState() {
    BlocProvider.of<ModelsCubit>(context).getAllModels();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarCubit, BottomBarState>(
      builder: (context, state) {
        if (state is BottomBarInitial) {
          return Scaffold(
            body: Stack(
              children: [
                state.page,
                const Positioned(
                  bottom: 0,
                  child: CustomBottomBar(),
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
