// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

import 'package:rikaz_team/core/usecase/base_usecase.dart';
import 'package:rikaz_team/core/utils/typedef.dart';

import '../repository/base_users_repository.dart';

class UpdateUserInfoUseCase extends BaseUseCase<void, UpdateParameters> {
  UpdateUserInfoUseCase(this.usersRepository);

  final BaseUsersRepository usersRepository;

  @override
  ResultVoid call(UpdateParameters parameters) async {
    return await usersRepository.updateUserInfo(
      id: parameters.id,
      email: parameters.email,
      first_name: parameters.first_name,
      last_name: parameters.last_name,
    );
  }
}

class UpdateParameters extends Equatable {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  UpdateParameters({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
  });

  @override
  List<Object> get props {
    return [id, email, first_name, last_name];
  }
}
