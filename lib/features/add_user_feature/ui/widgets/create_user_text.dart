import 'package:flutter/material.dart';
import 'package:rikaz_team/core/theming/styles.dart';

class CreateUserText extends StatelessWidget {
  const CreateUserText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
          "Create User",
          style: TextStyles.font32BlueBold,
        );
  }
}