import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikaz_team/features/login_feature/logic/bloc/login_event.dart';
import 'package:rikaz_team/features/login_feature/logic/bloc/login_state.dart';




class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState.initial()) {
    on<LoginEvent>((event, emit) {
      event.when(
        started: SizedBox.shrink, 
        login: (){
          emit(const LoginState.loading());
        }
        );
    });
  }
}
