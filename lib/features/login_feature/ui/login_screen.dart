import 'package:flutter/material.dart';
import 'package:rikaz_team/core/theming/styles.dart';
import 'package:rikaz_team/core/widgets/app_text_button.dart';
import 'package:rikaz_team/features/login_feature/ui/widgets/email_and_password_text_feild.dart';
import 'package:rikaz_team/features/login_feature/ui/widgets/login_text_top.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LoginTextTop(),
            SizedBox(
              height: 0.036 * height,
            ),
            const EmailAndPasswordTextFeild(),
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: Text(
                'Forgot Password?',
                style: TextStyles.font13BlueRegular,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            AppTextButton(
              buttonText: "Login",
              textStyle: TextStyles.font16WhiteSemiBold,
              onPressed: () {
                // validateThenDoLogin(context);
              },
            ),
          ],
        ),
      )),
    );
  }
}
