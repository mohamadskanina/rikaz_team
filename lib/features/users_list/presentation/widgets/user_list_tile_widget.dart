import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../domain/entities/user.dart';

class UserListTileWidget extends StatelessWidget {
  const UserListTileWidget({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(10.r),
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            radius: 30.r,
            backgroundColor: Colors.grey[200],
            backgroundImage: NetworkImage(user.avatar),
          ),
          title: Text(
            '${user.first_name} ${user.last_name}',
            style: TextStyle(
              color: Colors.blue[700],
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            user.email,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14.sp,
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.more_vert,
              color: Colors.grey[600],
            ),
            onPressed: () {},
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
        ),
      ),
    );
  }
}
