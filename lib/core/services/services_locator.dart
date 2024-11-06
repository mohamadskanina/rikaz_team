import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:rikaz_team/core/network/dio_factory.dart';
import 'package:rikaz_team/features/add_user_feature/data/repo/create_user_repo.dart';
import 'package:rikaz_team/features/add_user_feature/logic/bloc/createuser_bloc.dart';
import 'package:rikaz_team/features/login_feature/data/apis/api_service.dart';
import 'package:rikaz_team/features/login_feature/data/repo/login_repo.dart';
import 'package:rikaz_team/features/login_feature/logic/bloc/login_bloc.dart';

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
    sl.registerLazySingleton<BaseUsersRepository>(() => UsersRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseUserRemoteDataSource>(
        () => UserRemoteDataSource());

    /// Login
    // dio
    Dio dio = DioFactory.getDio();
    // api service
    sl.registerLazySingleton<ApiService>(() => ApiService(dio: dio));
    // login repo
    sl.registerLazySingleton<LoginRepo>(() => LoginRepo(apiService: sl()));
    // bloc
    sl.registerFactory<LoginBloc>(() => LoginBloc(sl()));

    /// Create User
    // create_user repo
    sl.registerLazySingleton<CreateUserRepo>(() => CreateUserRepo(apiService: sl()));
    // bloc
    sl.registerFactory<CreateuserBloc>(() => CreateuserBloc(sl()));
  }
}
