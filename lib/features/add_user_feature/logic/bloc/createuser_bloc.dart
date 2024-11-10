import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikaz_team/features/add_user_feature/data/models/create_user_request.dart';
import 'package:rikaz_team/features/add_user_feature/data/repo/create_user_repo.dart';
import 'package:rikaz_team/features/add_user_feature/logic/bloc/createuser_event.dart';
import 'package:rikaz_team/features/add_user_feature/logic/bloc/createuser_state.dart';

class CreateuserBloc extends Bloc<CreateuserEvent, CreateuserState> {
  final CreateUserRepo _createUserRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  String imagePath = "";
  final formKey = GlobalKey<FormState>();
  CreateuserBloc(this._createUserRepo)
      : super(const CreateuserState.initial()) {
    on<CreateuserEvent>((event, emit) async {
      await event.when(craete: () async {
        emit(const CreateuserState.loading());
        var response = await _createUserRepo.createuser(CreateUserRequest(
          name: nameController.text,
          email: emailController.text,
          image: imagePath,
        ));
        response.fold((failure) {
          emit(CreateuserState.failure(message: failure.message));
        }, (data) {
          emit(const CreateuserState.success());
          clear();
        });
      });
    });
  }

  clear() {
    emailController.clear();
    nameController.clear();
    formKey.currentState!.reset();
  }
}
