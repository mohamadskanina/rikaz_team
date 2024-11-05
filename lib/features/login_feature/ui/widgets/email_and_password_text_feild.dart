import 'package:flutter/material.dart';
import 'package:rikaz_team/core/widgets/app_text_form_feild.dart';

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
    return Column(
      children: [
        AppTextFormField(
          hintText: "Email",
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
    );
  }
}
