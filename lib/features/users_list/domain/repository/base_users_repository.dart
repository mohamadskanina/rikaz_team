import 'package:rikaz_team/core/utils/typedef.dart';

import '../entities/user.dart';

abstract class BaseUsersRepository {
  ResultFuture<List<User>> getUsersList();
  ResultVoid updateUserInfo(
      {required int id,
      required String first_name,
      required String last_name,
      required String email});
}
