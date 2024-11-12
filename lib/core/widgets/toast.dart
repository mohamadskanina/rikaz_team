import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Toast {
  Toast() {
    toastification.dismissAll();
  }
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

class InternetToast {
  InternetToast.online(BuildContext context) {
    toastification.dismissAll();
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.minimal,
      title: const Text("Back online"),
      alignment: Alignment.bottomLeft,
      showProgressBar: false,
      autoCloseDuration: const Duration(seconds: 2),
    );
  }
  InternetToast.offline(BuildContext context) {
    toastification.dismissAll();
    toastification.show(
      context: context,
      type: ToastificationType.error,
      icon: const Icon(Icons.cloud_off),
      style: ToastificationStyle.minimal,
      title: const Text("You are offline"),
      alignment: Alignment.bottomLeft,
      showProgressBar: false,
    );
  }
}
