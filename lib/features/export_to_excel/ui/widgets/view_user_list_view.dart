import 'package:flutter/material.dart';

class ViewUserListView extends StatelessWidget {
  const ViewUserListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage:
                          NetworkImage("state.users[i].avatar"),
                    ),
                    title: Text(
                      "state.users[i].firstName!" + "state.users[i].lastName!",
                      style: TextStyle(
                          color: Colors.blue[700], fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("state.users[i].email"),
                  );
                });
  }
}