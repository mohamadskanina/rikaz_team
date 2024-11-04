// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_bloc.dart';

class UserState extends Equatable {
  final List<User> getUsers;
  final RequestState getUsersState;
  final String getUsersMessage;

  const UserState({
    this.getUsers = const [],
    this.getUsersState = RequestState.loading,
    this.getUsersMessage = '',
  });

  @override
  List<Object> get props {
    return [
      getUsers,
      getUsersState,
      getUsersMessage,
    ];
  }

  UserState copyWith({
    List<User>? getUsers,
    RequestState? getUsersState,
    String? getUsersMessage,
  }) {
    return UserState(
        getUsers: getUsers ?? this.getUsers,
        getUsersState: getUsersState ?? this.getUsersState,
        getUsersMessage: getUsersMessage ?? this.getUsersMessage);
  }
}
