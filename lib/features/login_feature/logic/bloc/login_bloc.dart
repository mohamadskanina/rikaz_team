import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikaz_team/features/login_feature/data/models/login_request.dart';
import 'package:rikaz_team/features/login_feature/data/repo/login_repo.dart';
import 'package:rikaz_team/features/login_feature/logic/bloc/login_event.dart';
import 'package:rikaz_team/features/login_feature/logic/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepo _loginRepo;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  LoginBloc(this._loginRepo) : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) async {
      await event.when(
        login: () async {
          emit(const LoginState.loading());
          final response = await _loginRepo.login(LoginRequest(
            email: emailController.text,
            password: passwordController.text,
          ));
          response.fold((failure) {
            emit(LoginState.failure(message: failure.message));
          }, (data) {
            emit(LoginState.success(data));
          });
        },
      );
    });
  }
}
