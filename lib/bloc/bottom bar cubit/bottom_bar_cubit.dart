import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:sputnik_test/pages/followers_page.dart';
import 'package:sputnik_test/pages/home_page.dart';
import 'package:sputnik_test/pages/profile_page.dart';

part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(BottomBarInitial(pageIndex: 0, page: const HomePage()));

  setNewValue(int value) {
    switch (value) {
      case 0:
        return emit(BottomBarInitial(pageIndex: value, page: const HomePage()));
      case 1:
        return emit(BottomBarInitial(pageIndex: value, page: const FollowersPage()));
      case 3:
        return emit(BottomBarInitial(pageIndex: value, page: const ProfilePage()));
    }
  }
}
