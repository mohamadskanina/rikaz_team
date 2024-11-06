import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      key: context.read<LoginBloc>().formKey,
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
          )
        ],
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginBloc >().formKey.currentState!.validate()) {
      context.read<LoginEvent>();
    }
  }
}
