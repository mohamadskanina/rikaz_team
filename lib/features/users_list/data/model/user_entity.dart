
import 'package:hive/hive.dart';
part 'user_entity.g.dart';
@HiveType(typeId: 0)
class UserEntity{
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String first_name;
  @HiveField(2)
  final String last_name;
  @HiveField(3)
  final String email;

  UserEntity({
    required this.id,
    required this.first_name,
    required this.last_name,
    required this.email,
  });
}
