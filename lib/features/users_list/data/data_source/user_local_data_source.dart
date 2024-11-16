import 'package:hive/hive.dart';
import 'package:rikaz_team/features/users_list/data/model/user_entity.dart';

abstract class BaseUserLocalDataSource {
  List<UserEntity> getUsersList();
  void saveUsersData(List<UserEntity> users, String boxname);
}

class UserLocalDataSource extends BaseUserLocalDataSource {
  @override
  List<UserEntity> getUsersList() {
    var box = Hive.box<UserEntity>('users');
    return box.values.toList();
  }

  @override
  void saveUsersData(List<UserEntity> users, String boxname) {
    var box = Hive.box<UserEntity>(boxname);
    box.addAll(users);
  }
}
