// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class User extends Equatable {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });
  
  @override
  List<Object> get props {
    return [
      id,
      email,
      firstName,
      lastName,
      avatar,
    ];
  }
}
