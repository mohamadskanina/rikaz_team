part of 'edit_user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class EditUsersEvent extends UserEvent {}
