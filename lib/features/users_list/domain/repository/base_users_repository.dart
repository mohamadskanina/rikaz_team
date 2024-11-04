import '../entities/user.dart';

abstract class BaseUsersRepository {
  Future<List<User>> getUsersList();
}
