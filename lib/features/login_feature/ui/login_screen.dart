import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rikaz_team/core/helpers/space_helper.dart';
import 'package:rikaz_team/features/login_feature/ui/widgets/dont_have_account.dart';
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
              // wellcome back in top screen
              const LoginTextTop(),
              verticalspace(36),
              // login form --> email and password and login button 
              const EmailAndPasswordTextFeild(),
              verticalspace(30),
              const DontHaveAccountText(),
              const LoginBlocListiner(),
            ],
          ),
        ),
      )),
    );
  }

  
}
