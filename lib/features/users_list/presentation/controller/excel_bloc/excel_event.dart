import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rikaz_team/features/users_list/domain/entities/user.dart';
part 'excel_event.freezed.dart';
@freezed
class ExcelEvent with _$ExcelEvent {
  const factory ExcelEvent.exoprtToExcel(List<User> users) = ExportToEcel;
}