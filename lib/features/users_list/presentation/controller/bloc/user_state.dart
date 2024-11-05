import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user.dart';

part 'user_state.freezed.dart';

@freezed
class UserState with _$UserState {
  const factory UserState({
    @Default(<User>[]) List<User> users,
    @Default(false) bool loading,
    @Default(false) bool errorr,
  }) = _UserState;

}
