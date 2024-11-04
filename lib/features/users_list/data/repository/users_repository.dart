import 'package:rikaz_team/features/users_list/data/data_source/user_remote_data_source.dart';
import 'package:rikaz_team/features/users_list/domain/entities/user.dart';
import 'package:rikaz_team/features/users_list/domain/repository/base_users_repository.dart';

class UsersRepository extends BaseUsersRepository {
  final BaseUserRemoteDataSource _baseUserRemoteDataSource;
  UsersRepository(this._baseUserRemoteDataSource);

  @override
  Future<List<User>> getUsersList() async {
    
    final result = await _baseUserRemoteDataSource.getUsersList();
    return result;
  }
}
