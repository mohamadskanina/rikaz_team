import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikaz_team/core/helpers/extensions.dart';
import 'package:rikaz_team/core/theming/styles.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/excel_bloc/excel_bloc.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/excel_bloc/excel_state.dart';

class ExcelBlocListiner extends StatelessWidget {
  const ExcelBlocListiner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ExcelBloc, ExcelState>(
      listenWhen: (previous, current) =>
          current is LoadingExcel ||
          current is SuccessExcel ||
          current is FailureExcel,
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
            setupSuccessState(context, "Export File Successuly");
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
            'Close',
            style: TextStyles.font14DarkBlueMedium,
          ),
        ),
      ],
    ),
  );
}

void setupSuccessState(BuildContext context, String success) {
  context.pop();
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
            'Close',
            style: TextStyles.font14DarkBlueMedium,
          ),
        ),
      ],
    ),
  );
}
