part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetUsersEvent extends UserEvent {}
