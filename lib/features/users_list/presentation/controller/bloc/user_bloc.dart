import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/usecase/base_usecase.dart';
import '../../../../../core/utils/enums.dart';
import '../../../domain/entities/user.dart';
import '../../../domain/usecase/get_users.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;


  UserBloc(
      this.getUsersUseCase,)
      : super(const UserState()) {
    on<GetUsersEvent>(_getUsersHandler);
  }

  FutureOr<void> _getUsersHandler(
      GetUsersEvent event, Emitter<UserState> emit) async {
    final data = await getUsersUseCase(const NoParameters());
    // print(result);
    emit(state.copyWith(
            getUsers: data, getUsersState: RequestState.loaded));
  }
}
