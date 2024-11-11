import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenshot/screenshot.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:lottie/lottie.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rikaz_team/core/services/services_locator.dart';
import 'package:rikaz_team/core/widgets/toast.dart';
import 'package:share_plus/share_plus.dart';

part 'card_gen_state.dart';
part 'card_gen_cubit.freezed.dart';

class CardGenCubit extends Cubit<CardGenState> {
  CardGenCubit() : super(CardGenState.initial());

  final ScreenshotController screenshotController = ScreenshotController();

  Future<void> generateUserCard() async {
    if (state.loading) return;
    BuildContext? context = SingleInstanceService.navigatorKey.currentContext;
    if (context != null) {
      showDialog(
          context: context,
          builder: (BuildContext context) =>
              Lottie.asset('assets/loading.json', width: 30.w, height: 30.h));
    }
    emit(state.copyWith(loading: true));
    try {
      final Uint8List? screenshot = await screenshotController.capture();

      if (kIsWeb) {
        final blob = html.Blob([screenshot]);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute("download", "employee_card.png")
          ..click();
        html.Url.revokeObjectUrl(url);
      } else {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await screenshotController.captureAndSave(
          directory.path,
          fileName: 'employee_id_card.png',
        );
        if (imagePath != null) {
          await Share.shareXFiles(
            [XFile(imagePath)],
            text: 'here is employee card',
          );
        }
      }
      emit(state.copyWith(loading: false, error: false));
      context != null ? Navigator.of(context).pop() : print('context is Null');
    } catch (e) {
      print(e);
      emit(state.copyWith(loading: false, error: true));
      if (context != null) {
        Navigator.of(context).pop();
        Toast().error(context, 'Something happened, try again later.');
      } else {
        print('context is Null');
      }
    }
  }
}
