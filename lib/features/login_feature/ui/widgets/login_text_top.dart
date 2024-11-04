import 'package:flutter/material.dart';
import 'package:rikaz_team/core/theming/styles.dart';

class LoginTextTop extends StatelessWidget {
  const LoginTextTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Wellcome Back",
      style: TextStyles.font32BlueBold,
    );
  }
}
