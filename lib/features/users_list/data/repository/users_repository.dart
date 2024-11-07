import 'package:dartz/dartz.dart';
import 'package:rikaz_team/core/error/exceptions.dart';
import 'package:rikaz_team/core/utils/typedef.dart';
import 'package:rikaz_team/features/users_list/data/data_source/user_remote_data_source.dart';
import 'package:rikaz_team/features/users_list/data/model/user_model.dart';
import 'package:rikaz_team/features/users_list/domain/entities/user.dart';
import 'package:rikaz_team/features/users_list/domain/repository/base_users_repository.dart';

import '../../../../core/error/failure.dart';

class UsersRepository extends BaseUsersRepository {
  final BaseUserRemoteDataSource _baseUserRemoteDataSource;
  UsersRepository(this._baseUserRemoteDataSource);

  @override
  ResultFuture<List<User>> getUsersList() async {
    final result = await _baseUserRemoteDataSource.getUsersList();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.message,
          statusCode: failure.errorMessageModel.statusCode));
    }
  }

  @override
  ResultVoid updateUserInfo(
      {required int id,
      required String first_name,
      required String last_name,
      required String email}) async {
    await _baseUserRemoteDataSource.updateUserInfo(
      id: id,
      email: email,
      first_name: first_name,
      last_name: last_name,
    );
    try {
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.message,
          statusCode: failure.errorMessageModel.statusCode));
    }
  }
}
