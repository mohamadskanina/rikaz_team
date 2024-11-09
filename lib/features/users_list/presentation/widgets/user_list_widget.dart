import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:rikaz_team/core/helpers/space_helper.dart';
import 'package:rikaz_team/features/users_list/presentation/controller/excel_bloc/excel_bloc.dart';
import 'package:rikaz_team/features/users_list/presentation/widgets/Export_To_Excel/export_to_excel.dart';
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
                child: Lottie.asset(
                'assets/loading.json',
                width: 200,
                height: 200,
              ))
            : Column(
                children: [
                  SizedBox(
                      height: 400.h,
                      child: ListView.builder(
                          itemCount: state.users.length,
                          itemBuilder: (context, i) {
                            return ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                    NetworkImage(state.users[i].avatar),
                              ),
                              title: Text(
                                state.users[i].first_name +
                                    state.users[i].last_name,
                                style: TextStyle(
                                    color: Colors.blue[700],
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(state.users[i].email),
                            );
                          })),
                  verticalspace(10),
                  BlocProvider(
                    create: (context) => ExcelBloc(),
                    child: ExportToExcel(users: state.users),
                  )
                ],
              );
      },
    );
  }
}
