part of 'models_cubit.dart';

@immutable
abstract class ModelsState {}

class ModelsInitial extends ModelsState {
  ModelsInitial(
      {required this.userModel,
      required this.isLoaded,
      required this.followingModel,
      required this.repositoriesModel,
      required this.followersModel});

  bool isLoaded;
  UserInfoModel userModel;
  List<FollowingModel> followingModel;
  List<RepositoriesModel> repositoriesModel;
  List<FollowersModel> followersModel;
}
