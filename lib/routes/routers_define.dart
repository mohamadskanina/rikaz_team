import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:rikaz_team/features/users_list/presentation/screens/update_user_info.dart';
import 'package:rikaz_team/routes/routes_name.dart';

import '../features/users_list/presentation/screens/view_users_list.dart';

void configureRoutes(FluroRouter router) {
  router.define(
    RoutesNames.homePage,
    handler: Handler(
      handlerFunc: (context, parameters) {
        return const ViewUsersList();
      },
    ),
  );

  router.define(
    RoutesNames.updateUserInfo,
    handler: Handler(
      handlerFunc: (context, parameters) {
        Map<String, dynamic>? args =
            context!.settings!.arguments as Map<String, dynamic>?;
        if (args == null || args['user'] == null) {
          return const Text('error');
        }
        return UpdateUserInfo(user: args['user']);
      },
    ),
  );
}
