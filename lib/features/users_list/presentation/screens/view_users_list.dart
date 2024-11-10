import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rikaz_team/core/widgets/show_dialog.dart';
import 'package:rikaz_team/features/export_to_pdf/presentation/widgets/save_pdf_dialog.dart';

import '../../../../core/services/services_locator.dart';
import '../controller/view_user_bloc/user_bloc.dart';
import '../controller/view_user_bloc/user_state.dart';
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
            "User management",
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
          actions: [
            BlocBuilder<UserBloc, UserState>(
              builder: (dialogContext, state) {
                return !state.loading
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                        child: IconButton(
                          icon: const Icon(Icons.picture_as_pdf),
                          onPressed: () => ShowDialog(
                              context: dialogContext,
                              dialogWidget: const SavePdfDialog()),
                        ),
                      )
                    : Container();
              },
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              const Expanded(child: UserListWidget()),
            ],
          ),
        ),
      ),
    );
  }
}
