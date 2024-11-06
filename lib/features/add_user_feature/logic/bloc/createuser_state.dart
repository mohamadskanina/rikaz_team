
import 'package:freezed_annotation/freezed_annotation.dart';
part 'createuser_state.freezed.dart';
@freezed
class CreateuserState with _$CreateuserState {
  const factory CreateuserState.initial() = _Initial;
  const factory CreateuserState.loading() = CreateLoading;
  const factory CreateuserState.success() = CreateSuccess;
  const factory CreateuserState.failure({required String message}) = CreateFailure;
}
