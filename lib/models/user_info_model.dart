import 'package:json_annotation/json_annotation.dart';
part 'user_info_model.g.dart';

@JsonSerializable(createToJson: false)
class UserInfoModel {
  UserInfoModel({
    required this.login,
    required this.id,
    required this.nodeId,
    required this.avatarUrl,
    required this.gravatarId,
    required this.url,
    required this.htmlUrl,
    required this.followersUrl,
    required this.followingUrl,
    required this.gistsUrl,
    required this.starredUrl,
    required this.subscriptionsUrl,
    required this.organizationsUrl,
    required this.reposUrl,
    required this.eventsUrl,
    required this.receivedEventsUrl,
    required this.type,
    required this.siteAdmin,
    required this.name,
    required this.company,
    required this.blog,
    required this.location,
    required this.email,
    required this.hireable,
    required this.bio,
    required this.twitterUsername,
    required this.publicRepos,
    required this.publicGists,
    required this.followers,
    required this.following,
    required this.createdAt,
    required this.updatedAt,
  });

  String login;
  int id;
  @JsonKey(name: 'node_id')
  String nodeId;
  @JsonKey(name: 'avatar_url')
  String avatarUrl;
  @JsonKey(name: 'gravatar_id')
  dynamic gravatarId;
  String url;
  @JsonKey(name: 'html_url')
  String htmlUrl;
  @JsonKey(name: 'followers_url')
  String followersUrl;
  @JsonKey(name: 'following_url')
  String followingUrl;
  @JsonKey(name: 'gists_url')
  String gistsUrl;
  @JsonKey(name: 'starred_url')
  String starredUrl;
  @JsonKey(name: 'subscriptions_url')
  String subscriptionsUrl;
  @JsonKey(name: 'organizations_url')
  String organizationsUrl;
  @JsonKey(name: 'repos_url')
  String reposUrl;
  @JsonKey(name: 'events_url')
  String eventsUrl;
  @JsonKey(name: 'received_events_url')
  String receivedEventsUrl;
  String type;
  @JsonKey(name: 'site_admin')
  bool siteAdmin;
  String name;
  String company;
  String blog;
  String location;
  dynamic email;
  dynamic hireable;
  String bio;
  @JsonKey(name: 'twitter_username')
  String twitterUsername;
  @JsonKey(name: 'public_repos')
  int publicRepos;
  @JsonKey(name: 'public_gists')
  int publicGists;
  int followers;
  int following;
  @JsonKey(name: 'created_at')
  DateTime createdAt;
  @JsonKey(name: 'updated_at')
  DateTime updatedAt;

  factory UserInfoModel.fromJson(Map<String, dynamic> json) =>
      _$UserInfoModelFromJson(json);
}
