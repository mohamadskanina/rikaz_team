import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rikaz_team/routes/router_screens.dart';
import 'package:rikaz_team/routes/routes_name.dart';

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
          leading: CachedNetworkImage(
            imageUrl: user.avatar,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error, color: Colors.red),
            imageBuilder: (context, imageProvider) => CircleAvatar(
              backgroundImage: imageProvider,
              radius: 30.r,
            ),
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
            onPressed: () {
              AppRouter.router.navigateTo(
                context,
                RoutesNames.updateUserInfo,
                clearStack: false,
                transition: TransitionType.inFromBottom,
                routeSettings: RouteSettings(
                  arguments: {"user": user},
                ),
              );
            },
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 12.w),
        ),
      ),
    );
  }
}
