import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikaz_team/core/helpers/extensions.dart';
import 'package:rikaz_team/core/theming/styles.dart';
import 'package:rikaz_team/features/login_feature/logic/bloc/login_bloc.dart';
import 'package:rikaz_team/features/login_feature/logic/bloc/login_state.dart';
import 'package:rikaz_team/features/login_feature/ui/widgets/home_screen.dart';

class LoginBlocListiner extends StatelessWidget {
  const LoginBlocListiner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
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
          success: (data) {
            context.pop();
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
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
