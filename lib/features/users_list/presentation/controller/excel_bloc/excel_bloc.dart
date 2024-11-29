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
        var result = await exportExcel(users);
        result.fold((error) {
          emit(ExcelState.failure(message: error));
        }, (users) {
          emit(const ExcelState.success());
        });
      });
    });
  }

  Future<Either<String, bool>> exportExcel(List<User> users) async {
    try {
      final excel = Excel.createExcel();
      excel.rename(excel.getDefaultSheet()!, "Users Sheet");

      final sheet = excel["Users Sheet"];

      _addHeader(sheet);

      for (var i = 0; i < users.length; i++) {
        _addUser(sheet, users[i], i + 2);
      }

      _autoFitColumns(sheet);

      if (kIsWeb) {
        _downloadOnBrowser(excel);
      } else {
        _downloadOnMobileOrDesktop(excel);
      }

      return const Right(true);
    } catch (e) {
      return const Left("Failed to export excel file");
    }
  }

  void _addHeader(Sheet sheet) {
    sheet.cell(CellIndex.indexByString("A1")).value = TextCellValue("user_id");
    sheet.cell(CellIndex.indexByString("B1")).value =
        TextCellValue("user_name");
    sheet.cell(CellIndex.indexByString("C1")).value =
        TextCellValue("user_email");
  }

  void _addUser(Sheet sheet, User user, int row) {
    sheet.cell(CellIndex.indexByString("A$row")).value = IntCellValue(user.id);
    sheet.cell(CellIndex.indexByString("B$row")).value =
        TextCellValue('${user.first_name} ${user.last_name}');
    sheet.cell(CellIndex.indexByString("C$row")).value =
        TextCellValue(user.email);
  }

  void _autoFitColumns(Sheet sheet) {
    sheet.setColumnAutoFit(0);
    sheet.setColumnAutoFit(1);
    sheet.setColumnAutoFit(2);
  }

  void _downloadOnBrowser(Excel excel) {
    final blob = html.Blob([excel.save(fileName: "users.xlsx")], 'files/xlsx');
    final url = html.Url.createObjectUrlFromBlob(blob);

    html.AnchorElement(href: url)
      ..setAttribute("download", "users.xlsx")
      ..click();
    html.Url.revokeObjectUrl(url);
  }

  void _downloadOnMobileOrDesktop(Excel excel) async {
    // download on mobiles or disktop
    var fileBytes = excel.save();
    var directory = await getApplicationDocumentsDirectory();

    File('${directory.path}/users_list.xlsx')
      ..createSync(recursive: true)
      ..writeAsBytesSync(fileBytes!);
  }
}
