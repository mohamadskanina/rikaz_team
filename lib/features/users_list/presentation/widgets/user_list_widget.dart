import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rikaz_team/features/users_list/presentation/widgets/user_list_tile_widget.dart';

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
      buildWhen: (previous, current) =>
          previous.loading != current.loading ||
          previous.error != current.error,
      builder: (context, state) {
        if (state.error) {
          return Center(
              child: Lottie.asset('assets/error.json',
                  width: 300.w, height: 300.h));
        }
        return state.loading
            ? Center(
                child: Lottie.asset('assets/loading.json',
                    width: 200.w, height: 200.h))
            : ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, i) {
                  return Column(
                    children: [
                      UserListTileWidget(user: state.users[i]),
                    ],
                  );
                });
      },
    );
  }
}
