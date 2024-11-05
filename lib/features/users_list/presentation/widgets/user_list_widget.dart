import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../controller/bloc/user_bloc.dart';
import '../controller/bloc/user_state.dart';

class UserListWidget extends StatefulWidget {
  const UserListWidget({super.key});

  @override
  State<UserListWidget> createState() => _UserListWidgetState();
}

class _UserListWidgetState extends State<UserListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) => previous.loading != current.loading,
      builder: (context, state) {
        return state.loading
            ? Center(
                child: Lottie.asset('assets/loading.json',
                    width: 200, height: 200))
            : ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(state.users[i].avatar),
                    ),
                    title: Text(state.users[i].firstName +
                        state.users[i].lastName),
                    subtitle: Text(state.users[i].email),
                  );
                });
      },
    );
  }
}
