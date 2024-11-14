part of 'card_gen_cubit.dart';

@freezed
class CardGenState with _$CardGenState {
  const factory CardGenState.initial({
    @Default(false) bool loading,
    @Default(false) bool error,
  }) = _Initial;
}
