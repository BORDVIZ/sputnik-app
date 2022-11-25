import 'package:json_annotation/json_annotation.dart';
part 'followers_model.g.dart';

@JsonSerializable(createToJson: false)
class FollowersModel {
  FollowersModel({
    required this.login,
    required this.id,
    required this.avatarUrl,
  });

  String login;
  int id;
  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  factory FollowersModel.fromJson(Map<String, dynamic> json) =>
      _$FollowersModelFromJson(json);
}
