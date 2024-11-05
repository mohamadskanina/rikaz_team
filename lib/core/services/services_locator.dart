import 'package:get_it/get_it.dart';

import '../../features/users_list/data/data_source/user_remote_data_source.dart';
import '../../features/users_list/data/repository/users_repository.dart';
import '../../features/users_list/domain/repository/base_users_repository.dart';
import '../../features/users_list/domain/usecase/get_users.dart';
import '../../features/users_list/presentation/controller/bloc/user_bloc.dart';



final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    _userSL();
  }

  void _userSL() {
    /// Bloc
    sl.registerLazySingleton(() => UserBloc(sl()));

    /// USE CACES
    sl.registerLazySingleton(() => GetUsersUseCase(sl()));

    /// REPOSESITORY
    sl.registerLazySingleton<BaseUsersRepository>(
        () => UsersRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseUserRemoteDataSource>(
        () => UserRemoteDataSource());
  }

}
