import 'dart:convert';

import 'package:http/http.dart';
import 'package:sputnik_test/models/followers_model.dart';
import 'package:sputnik_test/models/following_model.dart';
import 'package:sputnik_test/models/repositories_models.dart';
import 'package:sputnik_test/models/user_info_model.dart';

class NetworkServices {
  Future<UserInfoModel> getUserInfo() async {
    try {
      final response =
          await get(Uri.parse('https://api.github.com/users/GantMan'));
      return UserInfoModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      print('error ${e.toString()}');
      return UserInfoModel(
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
    }
  }

  Future<List<FollowingModel>> setFollowingModel() async {
    try {
      final response = await get(
          Uri.parse('https://api.github.com/users/GantMan/following'));
      final List data = jsonDecode(response.body);
      List<FollowingModel> following = [];
      if (response.statusCode >= 200 && response.statusCode < 300) {
        for (int i = 0; i < data.length; i++) {
          following.add(FollowingModel.fromJson(data[i]));
        }
      }
      return following;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<RepositoriesModel>> setRepositoriesModel() async {
    try {
      final response = await get(
          Uri.parse('https://api.github.com/users/GantMan/repos'));
      final List data = jsonDecode(response.body);
      List<RepositoriesModel> following = [];
      if (response.statusCode >= 200 && response.statusCode < 300) {
        for (int i = 0; i < data.length; i++) {
          following.add(RepositoriesModel.fromJson(data[i]));
        }
      }
      return following;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<FollowersModel>> setFollowersModel() async {
    try {
      final response = await get(
          Uri.parse('https://api.github.com/users/GantMan/followers'));
      final List data = jsonDecode(response.body);
      List<FollowersModel> following = [];
      if (response.statusCode >= 200 && response.statusCode < 300) {
        for (int i = 0; i < data.length; i++) {
          following.add(FollowersModel.fromJson(data[i]));
        }
      }
      return following;
    } catch (e) {
      print(e.toString());
      return [];
    }
  }
}
