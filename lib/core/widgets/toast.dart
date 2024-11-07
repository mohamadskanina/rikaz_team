
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Toast{

  void warning(BuildContext context, String message) {
    toastification.show(
      context: context,
      type: ToastificationType.warning,
      style: ToastificationStyle.flat,
      title: Text(message),
      alignment: Alignment.bottomRight,
      showProgressBar: false,
      autoCloseDuration: const Duration(seconds: 4),
    );
  }

  void error(BuildContext context, String message) {
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.flat,
      title: Text(message),
      alignment: Alignment.topCenter,
      showProgressBar: false,
      autoCloseDuration: const Duration(seconds: 4),
    );
  }

  void success(BuildContext context, String message) {
    toastification.show(
      // context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      title: Text(message),
      alignment: Alignment.topCenter,
      showProgressBar: false,
      autoCloseDuration: const Duration(seconds: 4),
    );
  }
}