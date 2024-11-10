// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String email;
  final String first_name;
  final String last_name;
  final String avatar;

  const User({
    required this.id,
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.avatar,
  });
  
  @override
  List<Object> get props {
    return [
      id,
      email,
      first_name,
      last_name,
      avatar,
    ];
  }
}
