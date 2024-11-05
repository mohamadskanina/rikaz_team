import 'package:flutter/material.dart';

import '../../domain/entities/user.dart';

class UserListTileWidget extends StatelessWidget {
  const UserListTileWidget({super.key,required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: NetworkImage(user.avatar),
      ),
      title: Text(
        '${user.first_name} ${user.last_name}',
        style: TextStyle(color: Colors.blue[700], fontWeight: FontWeight.bold),
      ),
      subtitle: Text(user.email),
    );
  }
}
