import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rikaz_team/features/users_list/domain/usecase/update_user_info.dart';
import 'edit_user_state.dart';

part 'edit_user_event.dart';

class EditUserBloc extends Bloc<UserEvent, EditUserState> {
  final UpdateUserInfoUseCase updateUserInfoUseCase;

  EditUserBloc(
    this.updateUserInfoUseCase,
  ) : super(const EditUserState.initial()) {
    on<EditUsersEvent>(_editUsersHandler);
  }

  FutureOr<void> _editUsersHandler(
      EditUsersEvent event, Emitter<EditUserState> emit) async {
    emit(state.copyWith(loading: true));
    final result = await updateUserInfoUseCase(UpdateParameters(
        id: id,
        email: email,
        first_name: first_name,
        last_name: last_name,
        avatar: avatar));
    // print(result);
    result.fold(
        (l) => emit(state.copyWith(
            errorMessage: l.message, error: true, loading: false)),
        (r) => emit(state.copyWith(loading: false, error: false)));
  }
}
