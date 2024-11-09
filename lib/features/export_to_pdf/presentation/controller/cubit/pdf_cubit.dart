import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:universal_html/html.dart' as html;
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:rikaz_team/core/services/services_locator.dart';
import 'package:rikaz_team/core/widgets/toast.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/view_user_bloc/user_bloc.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/view_user_bloc/user_state.dart';

import '../../widgets/expoet_to_pdf.dart';

part 'pdf_state.dart';
part 'pdf_cubit.freezed.dart';

class PdfCubit extends Cubit<PdfState> {
  PdfCubit() : super(PdfState.initial());
  UserState usersState = sl<UserBloc>().state;

  Future<void> printPdfReport() async {
    if (state.loading) return;
    BuildContext? context = SingleInstanceService.navigatorKey.currentContext;
    if (context != null) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              Lottie.asset('assets/loading_pdf.json', width: 30, height: 30));
    }
    emit(state.copyWith(loading: true));
    try {
      var pdf = await exportUsersToPDF(usersState.users);
      await Printing.layoutPdf(
        onLayout: (format) async => pdf.save(),
      );

      emit(state.copyWith(loading: false, error: false));
      context != null ? Navigator.of(context).pop() : print('context is Null');
    } catch (e) {
      emit(state.copyWith(loading: false, error: true));
      context != null
          ? Toast().error(context, 'Something happened, try again later.')
          : print('context is Null');
    }
  }

  Future<void> savePdfLocalStorage() async {
    if (state.loading) return;
    BuildContext? context = SingleInstanceService.navigatorKey.currentContext;
    if (context != null) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              Lottie.asset('assets/loading_pdf.json', width: 30, height: 30));
    }
    emit(state.copyWith(loading: true));

    try {
      var pdf = await exportUsersToPDF(usersState.users);

      if (kIsWeb) {
        // here for dwonload form brawser
        final pdfData = await pdf.save();
        final blob = html.Blob([pdfData], 'application/pdf');
        final url = html.Url.createObjectUrlFromBlob(blob);

        html.AnchorElement(href: url)
          ..setAttribute("download", "users_list.pdf")
          ..click();
        html.Url.revokeObjectUrl(url);
        
      } else {
        // here for downlood form disckto or moblies
        final output = await getTemporaryDirectory();
        final file = File("${output.path}/users_list.pdf");
        await file.writeAsBytes(await pdf.save());
      }


      emit(state.copyWith(loading: false, error: false));
      context != null ? Navigator.of(context).pop() : print('context is Null');
    } catch (e) {
      emit(state.copyWith(loading: false, error: true));
      context != null
          ? Toast().error(context, 'Something happened, try again later.')
          : print('context is Null');
    }
  }
}
