import 'package:rikaz_team/core/utils/typedef.dart';

import '../entities/user.dart';

abstract class BaseUsersRepository {
  ResultFuture<List<User>> getUsersList();
}
