// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:equatable/equatable.dart';

class User extends Equatable {
  int id;
  String email;
  String first_name;
  String last_name;
  String avatar;

  User({
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
