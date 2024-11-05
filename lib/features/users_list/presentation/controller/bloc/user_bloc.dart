import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/usecase/base_usecase.dart';
import '../../../domain/usecase/get_users.dart';
import 'user_state.dart';

part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;

  UserBloc(
    this.getUsersUseCase,
  ) : super(const UserState()) {
    on<GetUsersEvent>(_getUsersHandler);
  }

  FutureOr<void> _getUsersHandler(
      GetUsersEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(loading: true));
    final data = await getUsersUseCase(const NoParameters());
    // print(result);
    emit(state.copyWith(users: data, loading: false));
  }
}
