import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingDialogWidget extends StatelessWidget {
  const LoadingDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: Colors.transparent),
      child: Center(
          child: Lottie.asset('assets/loading.json', width: 200, height: 200)),
    ));
  }
}
