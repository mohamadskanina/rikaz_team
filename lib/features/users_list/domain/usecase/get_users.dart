
import 'package:rikaz_team/core/usecase/base_usecase.dart';

import '../entities/user.dart';
import '../repository/base_users_repository.dart';

class GetUsersUseCase extends BaseUseCase<List<User>, NoParameters> {
  GetUsersUseCase(this.usersRepository);

  final BaseUsersRepository usersRepository;

  @override
  Future<List<User>> call(NoParameters parameters) async {
    return await usersRepository.getUsersList();
  }
}