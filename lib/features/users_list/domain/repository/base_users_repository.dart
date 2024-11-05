import 'package:rikaz_team/core/utils/typedef.dart';

import '../../data/model/user_model.dart';
import '../entities/user.dart';

abstract class BaseUsersRepository {
  ResultFuture<List<User>> getUsersList();
  ResultVoid updateUserInfo(UserModel user);
}
