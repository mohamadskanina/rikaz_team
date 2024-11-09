import 'package:dartz/dartz.dart';
import 'package:rikaz_team/core/utils/exception.dart';
import 'package:rikaz_team/core/utils/failure_test.dart';
import 'package:rikaz_team/core/utils/typedef.dart';
import 'package:rikaz_team/features/users_list/data/data_source/user_remote_data_source.dart';
import 'package:rikaz_team/features/users_list/domain/entities/user.dart';
import 'package:rikaz_team/features/users_list/domain/repository/base_users_repository.dart';

class UsersRepository extends BaseUsersRepository {
  final BaseUserRemoteDataSource _baseUserRemoteDataSource;
  UsersRepository(this._baseUserRemoteDataSource);

  @override
  ResultFuture<List<User>> getUsersList() async {
    final result = await _baseUserRemoteDataSource.getUsersList();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailureTest(
          message: failure.errorMessageModel.message,
          statusCode: failure.errorMessageModel.statusCode));
    }
  }
  
  @override
  ResultVoid updateUserInfo({required User user}) {
    throw UnimplementedError();
  }
}