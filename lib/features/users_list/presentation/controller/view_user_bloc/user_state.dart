import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rikaz_team/features/users_list/domain/entities/user.dart';

part 'user_state.freezed.dart';
part 'user_state.g.dart';

@freezed
@JsonSerializable()
class UserState with _$UserState {
  const factory UserState({
    @Default([]) List<User> users,
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default('') String errorMessage,
  }) = _UserState;

  factory UserState.fromJson(Map<String, dynamic> json) => _$UserStateFromJson(json);
  Map<String, dynamic> toJson() => _$UserStateToJson(this);
}
