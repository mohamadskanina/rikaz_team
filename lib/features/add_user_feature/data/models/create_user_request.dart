
import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_user_request.g.dart';
@JsonSerializable()
class CreateUserRequest {
  final String name;
  final String email;

  CreateUserRequest({
    required this.name,
    required this.email,
  });

  Map<String , dynamic> toJson() => _$CreateUserRequestToJson(this);
}
