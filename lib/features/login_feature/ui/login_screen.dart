import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rikaz_team/core/helpers/space_helper.dart';
import 'package:rikaz_team/core/theming/styles.dart';
import 'package:rikaz_team/core/widgets/app_text_button.dart';
import 'package:rikaz_team/features/login_feature/logic/bloc/login_bloc.dart';
import 'package:rikaz_team/features/login_feature/logic/bloc/login_event.dart';
import 'package:rikaz_team/features/login_feature/ui/widgets/email_and_password_text_feild.dart';
import 'package:rikaz_team/features/login_feature/ui/widgets/login_bloc_listiner.dart';
import 'package:rikaz_team/features/login_feature/ui/widgets/login_text_top.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 30.h,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const LoginTextTop(),
              verticalspace(36),
              const EmailAndPasswordTextFeild(),
              verticalspace(15),
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  'Forgot Password?',
                  style: TextStyles.font13BlueRegular,
                ),
              ),
              verticalspace(30),
              AppTextButton(
                buttonText: "Login",
                textStyle: TextStyles.font16WhiteSemiBold,
                onPressed: () {
                  validateThenDoLogin(context);
                },
              ),
              const LoginBlocListiner(),
            ],
          ),
        ),
      )),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginBloc>().formKey.currentState!.validate()) {
      context.read<LoginBloc>().add(const LoginEvent.login());
    }
  }
}
