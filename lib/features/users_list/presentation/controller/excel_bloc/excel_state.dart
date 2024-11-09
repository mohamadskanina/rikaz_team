
import 'package:freezed_annotation/freezed_annotation.dart';
part 'excel_state.freezed.dart';
@freezed
class ExcelState with _$ExcelState {
  const factory ExcelState.initial() = _Initial;
  const factory ExcelState.loading() = LoadingExcel;
  const factory ExcelState.success() = SuccessExcel;
  const factory ExcelState.failure({required String message}) = FailureExcel;
}
