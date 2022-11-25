import 'package:json_annotation/json_annotation.dart';
part 'repositories_models.g.dart';

@JsonSerializable(createToJson: false)
class RepositoriesModel {
  RepositoriesModel(
      {required this.name,
      required this.stargazersCount,
      required this.forksCount,
      required this.owner});

  String name;
  @JsonKey(name: 'stargazers_count')
  int stargazersCount;
  @JsonKey(name: 'forks_count')
  int forksCount;
  Owner owner;

  factory RepositoriesModel.fromJson(Map<String, dynamic> json) =>
      _$RepositoriesModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class Owner {
  Owner({required this.id, required this.avatarUrl});

  int id;
  @JsonKey(name: 'avatar_url')
  String avatarUrl;

  factory Owner.fromJson(Map<String, dynamic> json) => _$OwnerFromJson(json);
}
