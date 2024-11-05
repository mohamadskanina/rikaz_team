import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikaz_team/core/services/services_locator.dart';
import 'package:rikaz_team/core/theming/styles.dart';
import 'package:rikaz_team/features/add_user_feature/ui/add_user_screen.dart';

import '../../../add_user_feature/logic/bloc/createuser_bloc.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an account?',
              style: TextStyles.font14GrayRegular,
            ),
            TextSpan(
              text: ' Sign Up',
              style: TextStyles.font13BlueRegular.copyWith(fontSize: 16),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BlocProvider(
                                create: (context) => sl<CreateuserBloc>(),
                                child: const AddUserScreen(),
                              )));
                },
            ),
          ],
        ),
      ),
    );
  }
}
