import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_user_request.g.dart';

@JsonSerializable()
class CreateUserRequest {
  final String name;
  final String email;
  final String image;

  CreateUserRequest({
    required this.name,
    required this.email,
    required this.image,
  });

  Map<String, dynamic> toJson() => _$CreateUserRequestToJson(this);
}
