part of 'internet_cubit.dart';

@freezed
class InternetState with _$InternetState {
  const factory InternetState.initial({
    @Default(true) bool isConnected,
  }) = _Initial;
}
