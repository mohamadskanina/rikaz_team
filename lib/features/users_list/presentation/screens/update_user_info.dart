import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rikaz_team/core/services/services_locator.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/edit_user_bloc/edit_user_bloc.dart';

import '../../domain/entities/user.dart';
import '../widgets/update_info_widget.dart';

class UpdateUserInfo extends StatefulWidget {
  const UpdateUserInfo({super.key, required this.user});
  final User user;
  @override
  State<UpdateUserInfo> createState() => _UpdateUserInfoState();
}

class _UpdateUserInfoState extends State<UpdateUserInfo> {
  EditUserBloc editUserBloc = sl<EditUserBloc>();
  @override
  void initState() {
    super.initState();
    editUserBloc.firstNameController =
        TextEditingController(text: widget.user.first_name);
    editUserBloc.lastNameController =
        TextEditingController(text: widget.user.last_name);
    editUserBloc.emailController =
        TextEditingController(text: widget.user.email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Update Users Info",
            style: TextStyle(
              color: Colors.blue[800],
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 1,
          iconTheme: IconThemeData(color: Colors.blue[800]),
        ),
      body: BlocProvider(
          create: (context) => editUserBloc,
          child: UpdateInfoWidget(
            user: widget.user,
            editUserBloc: editUserBloc,
          )),
    );
  }

  @override
  void dispose() {
    editUserBloc.close();
    super.dispose();
  }
}
