import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/services_locator.dart';
import '../controller/bloc/user_bloc.dart';
import '../widgets/user_list_widget.dart';

class ViewUsersList extends StatelessWidget {
  const ViewUsersList({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserBloc>()..add(GetUsersEvent()),
      child: Scaffold(
        appBar: AppBar(
            title: Text(
          "Users Managment",
          style:
              TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold),
        )),
        body: const UserListWidget(),
      ),
    );
  }
}
