
import 'package:rikaz_team/core/usecase/base_usecase.dart';
import 'package:rikaz_team/core/utils/typedef.dart';

import '../entities/user.dart';
import '../repository/base_users_repository.dart';

class GetUsersUseCase extends BaseUseCase<List<User>, NoParameters> {
  GetUsersUseCase(this.usersRepository);

  final BaseUsersRepository usersRepository;

  @override
  ResultFuture<List<User>> call(NoParameters parameters) async {
    return await usersRepository.getUsersList();
  }
}