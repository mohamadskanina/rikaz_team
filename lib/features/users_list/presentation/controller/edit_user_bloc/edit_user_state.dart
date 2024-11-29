import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_user_state.freezed.dart';

@freezed
class EditUserState with _$EditUserState {
  const factory EditUserState.initial({
    @Default(false) bool loading,
    @Default(false) bool error,
    @Default('') String errorMessage,
  })= _initial;
}
