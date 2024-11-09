part of 'pdf_cubit.dart';

@freezed
class PdfState with _$PdfState {
  const factory PdfState.initial({
    @Default(false) bool loading,
    @Default(false) bool error,
  }) = _Initial;
}
