import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikaz_team/core/helpers/space_helper.dart';
import 'package:rikaz_team/core/widgets/app_text_form_feild.dart';
import 'package:rikaz_team/features/add_user_feature/logic/bloc/createuser_bloc.dart';
import 'package:rikaz_team/localization/generated/l10n.dart';

class CreateUserForm extends StatelessWidget {
  const CreateUserForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<CreateuserBloc>().formKey,
        child: Column(children: [
      AppTextFormField(
        hintText: Lang.of(context).name,
        controller: context.read<CreateuserBloc>().nameController,
        validator: (vlaue) {
          if (vlaue == null || vlaue.isEmpty) {
            return "Please enter a valid name";
          }
        },
      ),
      verticalspace(10),
      AppTextFormField(
        hintText: Lang.of(context).email,
        controller: context.read<CreateuserBloc>().emailController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please enter a valid email";
          }
        },
      ),
    ]));
  }
}
