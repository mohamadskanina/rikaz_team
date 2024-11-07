import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:rikaz_team/core/services/services_locator.dart';
import 'package:rikaz_team/core/widgets/loading_dialog_widget.dart';
import 'package:rikaz_team/core/widgets/toast.dart';
import 'package:rikaz_team/features/users_list/domain/usecase/update_user_info.dart';
import 'edit_user_state.dart';

part 'edit_user_event.dart';

class EditUserBloc extends Bloc<EditUserEvent, EditUserState> {
  final UpdateUserInfoUseCase updateUserInfoUseCase;

  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController emailController;

  EditUserBloc(
    this.updateUserInfoUseCase,
  ) : super(const EditUserState.initial()) {
    on<UpdateUserInfoEvent>(_updateUsersHandler);
  }
  FutureOr<void> _updateUsersHandler(
      UpdateUserInfoEvent event, Emitter<EditUserState> emit) async {
    if (state.loading) return;
    BuildContext? context = SingleInstanceService.navigatorKey.currentContext;
    if (context != null) {
      if (emailController.text.isEmpty ||
          !emailController.text.contains('@') ||
          !emailController.text.contains('.')) {
        Toast().warning(context, 'Please enter correct email');
        return;
      }
      if (firstNameController.text.isEmpty) {
        Toast().warning(context, 'Please enter First Nmae');
        return;
      }
      if (lastNameController.text.isEmpty) {
        Toast().warning(context, 'Please enter Last Nmae');
        return;
      }
      showDialog(
          context: context,
          builder: (BuildContext context) => const LoadingDialogWidget());
    }
    emit(state.copyWith(loading: true));
      final result = await updateUserInfoUseCase(UpdateParameters(
          id: event.id,
          email: emailController.text,
          first_name: firstNameController.text,
          last_name: lastNameController.text));
    // print(result);
    result.fold((l) {
      emit(
          state.copyWith(errorMessage: l.message, error: true, loading: false));
      if (context != null) {
         Navigator.of(context).pop();
        Toast().error(context, l.message);
      }
    }, (r) {
      emit(state.copyWith(loading: false, error: false));
      if (context != null) {
        Navigator.of(context).pop();
        Toast().success(context, 'Success update user info');
      }
    });
  }
}
