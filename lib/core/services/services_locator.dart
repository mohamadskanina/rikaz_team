import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:rikaz_team/features/users_list/domain/usecase/update_user_info.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/edit_user_bloc/edit_user_bloc.dart';

import '../../features/users_list/data/data_source/user_remote_data_source.dart';
import '../../features/users_list/data/repository/users_repository.dart';
import '../../features/users_list/domain/repository/base_users_repository.dart';
import '../../features/users_list/domain/usecase/get_users.dart';
import '../../features/users_list/presentation/controller/view_user_bloc/user_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerLazySingleton<GlobalChangeNotifier>(
        () => GlobalChangeNotifier());
    _userSL();
  }

  void _userSL() {
    /// Bloc
    sl.registerLazySingleton(() => UserBloc(sl()));
    sl.registerFactory(() => EditUserBloc(sl()));

    /// USE CACES
    sl.registerLazySingleton(() => GetUsersUseCase(sl()));
    sl.registerLazySingleton(() => UpdateUserInfoUseCase(sl()));

    /// REPOSESITORY
    sl.registerLazySingleton<BaseUsersRepository>(() => UsersRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseUserRemoteDataSource>(
        () => UserRemoteDataSource());
  }
}

class GlobalChangeNotifier<T> {
  final PublishSubject<(String key, T)> subject =
      PublishSubject<(String key, T)>();
}

class SingleInstanceService {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
