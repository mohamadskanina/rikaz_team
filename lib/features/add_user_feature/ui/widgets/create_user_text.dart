import 'package:flutter/material.dart';
import 'package:rikaz_team/core/theming/styles.dart';
import 'package:rikaz_team/localization/generated/l10n.dart';

class CreateUserText extends StatelessWidget {
  const CreateUserText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
          Lang.of(context).createUser,
          style: TextStyles.font32BlueBold,
        );
  }
}