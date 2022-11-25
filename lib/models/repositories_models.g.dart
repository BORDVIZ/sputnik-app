// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repositories_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepositoriesModel _$RepositoriesModelFromJson(Map<String, dynamic> json) =>
    RepositoriesModel(
      name: json['name'] as String,
      stargazersCount: json['stargazers_count'] as int,
      forksCount: json['forks_count'] as int,
      owner: Owner.fromJson(json['owner'] as Map<String, dynamic>),
    );

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      id: json['id'] as int,
      avatarUrl: json['avatar_url'] as String,
    );
