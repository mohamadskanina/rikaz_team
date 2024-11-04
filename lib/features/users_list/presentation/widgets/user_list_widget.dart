import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/enums.dart';
import '../controller/bloc/user_bloc.dart';

class UserListWidget extends StatelessWidget {
  const UserListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      buildWhen: (previous, current) =>
          previous.getUsersState != current.getUsersState,
      builder: (context, state) {
        switch (state.getUsersState) {
          case RequestState.loading:
            return const SizedBox(
              height: 250.0,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return ListView.builder(
                itemCount: state.getUsers.length,
                itemBuilder: (context, i) {
                  return ListTile(
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(state.getUsers[i].avatar),
                    ),
                    title: Text(state.getUsers[i].firstName +
                        state.getUsers[i].lastName),
                    subtitle: Text(state.getUsers[i].email),
                  );
                });

          case RequestState.error:
            return SizedBox(
              height: 250.0,
              child: Center(
                child: Text(state.getUsersMessage),
              ),
            );
        }
      },
    );
  }
}
