import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rikaz_team/core/helpers/space_helper.dart';
import 'package:rikaz_team/features/export_to_excel/ui/widgets/view_user_list_view.dart';

class ViewUser extends StatelessWidget {
  const ViewUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 30.w,
          vertical: 30.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("View Users List"),
            verticalspace(20),
            const ViewUserListView(),
          ],
        ),
      )),
    );
  }
}
