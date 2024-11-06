import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikaz_team/core/helpers/extensions.dart';
import 'package:rikaz_team/features/add_user_feature/logic/bloc/createuser_bloc.dart';
import 'package:rikaz_team/features/add_user_feature/logic/bloc/createuser_state.dart';
import '../../../../core/theming/styles.dart';

class CreateUserBlocListiner extends StatelessWidget {
  const CreateUserBlocListiner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateuserBloc, CreateuserState>(
      listenWhen: (previous, current) =>
          current is CreateLoading ||
          current is CreateSuccess ||
          current is CreateFailure,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF247CFF),
                ),
              ),
            );
          },
          success: () {
            context.pop();
            setupSuccessState(context, "Create User Successfuly!");
          },
          failure: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}

void setupErrorState(BuildContext context, String error) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: TextStyles.font13BlueRegular,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: TextStyles.font14DarkBlueMedium,
          ),
        ),
      ],
    ),
  );
}

void setupSuccessState(BuildContext context, String success) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.check,
        color: Colors.green,
        size: 32,
      ),
      content: Text(
        success,
        style: TextStyles.font13BlueRegular,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: TextStyles.font14DarkBlueMedium,
          ),
        ),
      ],
    ),
  );
}
