import 'package:dartz/dartz.dart';
import 'package:rikaz_team/core/error/exceptions.dart';
import 'package:rikaz_team/core/error/failure.dart';
import 'package:rikaz_team/core/utils/typedef.dart';
import 'package:rikaz_team/features/users_list/data/data_source/user_local_data_source.dart';
import 'package:rikaz_team/features/users_list/data/data_source/user_remote_data_source.dart';
import 'package:rikaz_team/features/users_list/data/model/user_entity.dart';
import 'package:rikaz_team/features/users_list/data/model/user_model.dart';
import 'package:rikaz_team/features/users_list/domain/entities/user.dart';
import 'package:rikaz_team/features/users_list/domain/repository/base_users_repository.dart';

class UsersRepository extends BaseUsersRepository {
  final BaseUserRemoteDataSource _baseUserRemoteDataSource;
  final BaseUserLocalDataSource _baseUserLocalDataSource;
  UsersRepository(
      this._baseUserRemoteDataSource, this._baseUserLocalDataSource);

  @override
  ResultFuture<List<User>> getUsersList() async {
    try {
      final result = await _baseUserRemoteDataSource.getUsersList();
      // save data in local
      final users = addUserList(result);
      _baseUserLocalDataSource.saveUsersData(users , 'users');
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.message,
          statusCode: failure.errorMessageModel.statusCode));
    }
  }

  @override
  ResultVoid updateUserInfo({required User user}) async {
    await _baseUserRemoteDataSource.updateUserInfo(user: user);
    try {
      return const Right(null);
    } on ServerException catch (failure) {
      return Left(ServerFailure(
          message: failure.errorMessageModel.message,
          statusCode: failure.errorMessageModel.statusCode));
    }
  }

  List<UserEntity> addUserList(List<UserModel> users) {
    return users.map((userModel) {
      return UserEntity(
          id: userModel.id,
          first_name: userModel.first_name,
          last_name: userModel.last_name,
          email: userModel.email);
    }).toList();
  }

  @override
  List<User> getLocalUser() {
    final resultLocal = _baseUserLocalDataSource.getUsersList();
    if (resultLocal.isNotEmpty) {
      List<User> users = resultLocal.map((user) {
        return User(
            id: user.id,
            email: user.email,
            first_name: user.first_name,
            last_name: user.last_name,
            avatar: '');
      }).toList();
      return users;
    } else {
      return [];
    }
  }
}
