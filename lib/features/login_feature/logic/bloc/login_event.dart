import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_event.freezed.dart';
@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.started() = _Started;
  const factory LoginEvent.login() = _Login;
}