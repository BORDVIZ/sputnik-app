part of 'sing_in_cubit.dart';

@immutable
abstract class SingInState {}

class SingInInitial extends SingInState {
  SingInInitial(
      {required this.text,
      required this.enable,
      required this.error,
      required this.isLoading});
  String text;
  bool enable;
  bool error;
  bool isLoading;
}
