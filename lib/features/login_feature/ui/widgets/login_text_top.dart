import 'package:flutter/material.dart';
import 'package:rikaz_team/core/helpers/space_helper.dart';
import 'package:rikaz_team/core/theming/styles.dart';
import 'package:rikaz_team/localization/generated/l10n.dart';

class LoginTextTop extends StatelessWidget {
  const LoginTextTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Lang.of(context).welcomeBack,
          style: TextStyles.font32BlueBold,
        ),
        verticalspace(8.0),
        Text(
          Lang.of(context).welcomeBackMessage,
          style: TextStyles.font14GrayRegular,
        ),
      ],
    );
  }
}
