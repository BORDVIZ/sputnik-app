import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sputnik_test/models/user_info_model.dart';
import 'package:sputnik_test/pages/main_initial.dart';
import 'package:sputnik_test/services/network_services.dart';

part 'sing_in_state.dart';

class SingInCubit extends Cubit<SingInState> {
  SingInCubit()
      : super(SingInInitial(
            text: '', enable: true, error: false, isLoading: false));

  setNewValue(String text) {
    if (text == '' || text.split(' ')[0] == '') {
      emit(SingInInitial(
          text: '', enable: true, error: false, isLoading: false));
    } else {
      emit(SingInInitial(
          text: text, enable: false, error: false, isLoading: false));
    }
  }

  searchUser(String name, context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    emit(SingInInitial(
        text: name, enable: false, error: false, isLoading: true));
    NetworkServices services = NetworkServices();
    UserInfoModel model = await services.getUserInfo();
    if (name.toLowerCase() != model.name.split(' ')[0].toLowerCase()) {
      emit(SingInInitial(
          text: name, enable: false, error: true, isLoading: false));
    } else {
      emit(SingInInitial(
          text: name, enable: false, error: false, isLoading: false));
      await preferences.setBool('login', true);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => const MainInitial()));
    }
  }
}
