import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rikaz_team/core/helpers/space_helper.dart';
import 'package:rikaz_team/core/theming/styles.dart';
import 'package:rikaz_team/core/widgets/app_text_button.dart';
import 'package:rikaz_team/features/add_user_feature/logic/bloc/createuser_bloc.dart';
import 'package:rikaz_team/features/add_user_feature/logic/bloc/createuser_event.dart';
import 'package:rikaz_team/features/add_user_feature/ui/widgets/create_user_bloc_listiner.dart';
import 'package:rikaz_team/features/add_user_feature/ui/widgets/create_user_form.dart';
import 'package:rikaz_team/features/add_user_feature/ui/widgets/create_user_text.dart';
import 'package:rikaz_team/features/add_user_feature/ui/widgets/upload_user_image.dart';

class AddUserScreen extends StatelessWidget {
  const AddUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CreateUserText(),
                verticalspace(30),
                const UploadUserImage(),
                verticalspace(30),
                const CreateUserForm(),
                verticalspace(20),
                AppTextButton(
                  buttonText: "Create User",
                  textStyle: TextStyles.font16WhiteSemiBold,
                  onPressed: () {
                    validateThenDoLogin(context);
                  },
                ),
                const CreateUserBlocListiner(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<CreateuserBloc>().formKey.currentState!.validate()) {
      context.read<CreateuserBloc>().add(const CreateuserEvent.craete());
    }
  }
}
