import 'package:rikaz_team/features/users_list/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart'; // Required for generated code

@JsonSerializable()
class UserModel extends User {
  UserModel(
      {required super.id,
      required super.email,
      required super.first_name,
      required super.last_name,
      required super.avatar});

  UserModel copyWith({
    int? id,
    String? email,
    String? first_name,
    String? last_name,
    String? avatar,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      avatar: avatar ?? this.avatar,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
