part of 'bottom_bar_cubit.dart';

@immutable
abstract class BottomBarState {}

class BottomBarInitial extends BottomBarState {
  BottomBarInitial({required this.pageIndex, required this.page});

  int pageIndex;
  Widget page;
}
