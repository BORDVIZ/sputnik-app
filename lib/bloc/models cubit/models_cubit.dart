import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sputnik_test/models/followers_model.dart';
import 'package:sputnik_test/models/following_model.dart';
import 'package:sputnik_test/models/repositories_models.dart';
import 'package:sputnik_test/models/user_info_model.dart';
import 'package:sputnik_test/services/network_services.dart';
part 'models_state.dart';

final UserInfoModel emptyUser = UserInfoModel(
    login: '',
    id: 0,
    nodeId: '',
    avatarUrl: '',
    gistsUrl: '',
    gravatarId: '',
    url: '',
    siteAdmin: false,
    updatedAt: DateTime.now(),
    createdAt: DateTime.now(),
    name: '',
    followers: 0,
    following: 0,
    publicGists: 0,
    publicRepos: 0,
    email: '',
    type: '',
    htmlUrl: '',
    hireable: '',
    starredUrl: '',
    subscriptionsUrl: '',
    followersUrl: '',
    followingUrl: '',
    receivedEventsUrl: '',
    reposUrl: '',
    eventsUrl: '',
    twitterUsername: '',
    location: '',
    organizationsUrl: '',
    bio: '',
    blog: '',
    company: '');

class ModelsCubit extends Cubit<ModelsState> {
  ModelsCubit()
      : super(ModelsInitial(
            isLoaded: false,
            userModel: emptyUser,
            followingModel: const [],
            repositoriesModel: const [],
            followersModel: const []));

  NetworkServices services = NetworkServices();

  getAllModels() async {
    emit(ModelsInitial(
        isLoaded: true,
        userModel: emptyUser,
        followingModel: const [],
        repositoriesModel: const [],
        followersModel: const []));
    UserInfoModel userInfoModel = await services.getUserInfo();
    List<FollowingModel> followingModel = await services.setFollowingModel();
    List<RepositoriesModel> repositoriesModel =
        await services.setRepositoriesModel();
    List<FollowersModel> followersModel = await services.setFollowersModel();
    emit(ModelsInitial(
        userModel: userInfoModel,
        followingModel: followingModel,
        repositoriesModel: repositoriesModel,
        followersModel: followersModel,
        isLoaded: false));
  }
}
