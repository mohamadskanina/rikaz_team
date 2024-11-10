import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShowDialog {
  final Widget dialogWidget;
  ShowDialog({required BuildContext context, required this.dialogWidget}) {
    _show(context);
  }

  void _show(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (dialogContext) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0).w,
          child: Dialog(
            elevation: 0,
            insetPadding: EdgeInsets.zero,
            backgroundColor: Colors.white,
            child: SizedBox(
              height: 600.h,
              child: dialogWidget,
            ),
          ),
        );
      },
    );
  }
}
