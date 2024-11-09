import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:rikaz_team/features/users_list/domain/entities/user.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/excel_bloc/excel_event.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/excel_bloc/excel_state.dart';

class ExcelBloc extends Bloc<ExcelEvent, ExcelState> {
  ExcelBloc() : super(const ExcelState.initial()) {
    on<ExcelEvent>((event, emit) {
      event.when(exoprtToExcel: (users) async {
        emit(const ExcelState.loading());
        var result = await expotExcel(users);
        result.fold((error) {
          emit(ExcelState.failure(message: error));
        }, (users) {
          emit(const ExcelState.success());
        });
      });
    });
  }

  Future<Either<String, bool>> expotExcel(List<User> users) async {
    try {
      final Excel excel = Excel.createExcel();
      excel.rename(excel.getDefaultSheet()!, "Users Sheet");

      Sheet sheet = excel["Users Sheet"];

      var cell = sheet.cell(CellIndex.indexByString("A1"));
      cell.value = TextCellValue("user_id");

      var cell2 = sheet.cell(CellIndex.indexByString("B1"));
      cell2.value = TextCellValue("user_name");

      var cell3 = sheet.cell(CellIndex.indexByString("C1"));
      cell3.value = TextCellValue("user_email");

      for (var i = 2; i < users.length; i++) {
        var cell4 = sheet.cell(CellIndex.indexByString("A$i"));
        cell4.value = IntCellValue(users[i-2].id);

        cell4 = sheet.cell(CellIndex.indexByString("B$i"));
        cell4.value = TextCellValue(users[i-2].first_name + users[i-2].last_name);

        cell4 = sheet.cell(CellIndex.indexByString("C$i"));
        cell4.value = TextCellValue(users[i-2].email);
      }

      sheet.setColumnAutoFit(0);
      sheet.setColumnAutoFit(1);
      sheet.setColumnAutoFit(2);

      if (kIsWeb) {
        // download on browser
        final filesheet = excel.save(fileName: "users.xlsx");

        final blob = html.Blob([filesheet], 'files/xlsx');
        final url = html.Url.createObjectUrlFromBlob(blob);

        html.AnchorElement(href: url)
          ..setAttribute("download", "users.xlsx")
          ..click();
        html.Url.revokeObjectUrl(url);
      } else {
        // download on mobiles or disktop
        var directory = await getApplicationDocumentsDirectory();
        final file = File('${directory.path}/users.xlsx');
        await file.writeAsBytes(excel.save()!);
      }
      return const Right(true);
    } catch (e) {
      return const Left("failed to emport excel file");
    }
  }
}
