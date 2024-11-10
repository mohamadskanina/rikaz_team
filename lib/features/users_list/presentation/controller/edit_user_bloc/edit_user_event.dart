part of 'edit_user_bloc.dart';

abstract class EditUserEvent extends Equatable {
  const EditUserEvent();

  @override
  List<Object?> get props => [];
}

class UpdateUserInfoEvent extends EditUserEvent {
  final int id;

  const UpdateUserInfoEvent({
    required this.id,
  });

  @override
  List<Object> get props {
    return [id];
  }
}
