import 'package:flutter/material.dart';
import 'package:rikaz_team/core/theming/styles.dart';

class LoginTextTop extends StatelessWidget {
  const LoginTextTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Wellcome Back",
          style: TextStyles.font32BlueBold,
        ),
        Text(
          'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
          style: TextStyles.font14GrayRegular,
        ),
      ],
    );
  }
}
