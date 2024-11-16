import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikaz_team/core/helpers/space_helper.dart';
import 'package:rikaz_team/core/theming/styles.dart';
import 'package:rikaz_team/core/widgets/app_text_button.dart';
import 'package:rikaz_team/core/widgets/app_text_form_feild.dart';
import 'package:rikaz_team/features/login_feature/logic/bloc/login_bloc.dart';
import 'package:rikaz_team/features/login_feature/logic/bloc/login_event.dart';

class EmailAndPasswordTextFeild extends StatefulWidget {
  const EmailAndPasswordTextFeild({super.key});

  @override
  State<EmailAndPasswordTextFeild> createState() =>
      _EmailAndPasswordTextFeildState();
}

class _EmailAndPasswordTextFeildState extends State<EmailAndPasswordTextFeild> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginBloc>().loginKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Email",
            controller: context.read<LoginBloc>().emailController,
            validator: (vlaue) {
              if (vlaue == null || vlaue.isEmpty) {
                return "Please enter a valid email";
              }
            },
          ),
          const SizedBox(
            height: 18,
          ),
          AppTextFormField(
            hintText: "Password",
            controller: context.read<LoginBloc>().passwordController,
            isObscureText: isObscureText,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid password";
              }
            },
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalspace(15),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              'Forgot Password?',
              style: TextStyles.font13BlueRegular,
            ),
          ),
          verticalspace(30),
          // login button
          AppTextButton(
            buttonText: "Login",
            textStyle: TextStyles.font16WhiteSemiBold,
            onPressed: () {
              validateThenDoLogin(context);
            },
          ),
        ],
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginBloc>().loginKey.currentState!.validate()) {
      context.read<LoginBloc>().add(const LoginEvent.login());
    }
  }
}
