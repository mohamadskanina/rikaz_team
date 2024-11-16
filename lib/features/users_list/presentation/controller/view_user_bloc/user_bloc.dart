import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:rikaz_team/core/services/services_locator.dart';
import 'package:rikaz_team/core/widgets/toast.dart';
import 'package:rikaz_team/features/offline_mode_ui/controller/internet_cubit.dart';
import 'package:rikaz_team/localization/generated/l10n.dart';
import '../../../../../core/usecase/base_usecase.dart';
import '../../../domain/usecase/get_users.dart';
import 'user_state.dart';

part 'user_event.dart';

class UserBloc extends HydratedBloc<UserEvent, UserState> {
  final GetUsersUseCase getUsersUseCase;

  UserBloc(
    this.getUsersUseCase,
  ) : super(const UserState()) {
    on<GetUsersEvent>(_getUsersHandler);
  }

  FutureOr<void> _getUsersHandler(
      GetUsersEvent event, Emitter<UserState> emit) async {
    emit(state.copyWith(loading: true));

    BuildContext? context = SingleInstanceService.navigatorKey.currentContext;
    List<ConnectivityResult> connectionStatus =
        BlocProvider.of<InternetCubit>(context!).connectionStatus;
    if (connectionStatus.contains(ConnectionState.none)) {
      if (state.users.isEmpty) {
        emit(state.copyWith(
            loading: false,
            error: true,
            errorMessage: Lang.current.checkConnection));
      } else {
        emit(state.copyWith(loading: false, error: false));
        Toast().error(context, Lang.current.offlineCachedData);
      }
    } else {
      final result = await getUsersUseCase(const NoParameters());
      result.fold(
          (l) => emit(state.copyWith(
              errorMessage: l.message, error: true, loading: false)),
          (r) => emit(state.copyWith(users: r, loading: false, error: false)));
    }
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) {
    try {
      return UserState.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(UserState state) {
    return state.toJson();
  }
}
