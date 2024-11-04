

import '../../../../core/utils/typedef.dart';
import '../entities/user.dart';

abstract class BaseUsersRepository {
  ResultFuture<User> getUser();
}