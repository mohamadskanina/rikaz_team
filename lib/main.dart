import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rikaz_team/routes/router_screens.dart';
import 'package:rikaz_team/routes/routers_define.dart';
import 'package:rikaz_team/routes/routes_name.dart';
import 'package:toastification/toastification.dart';

import 'core/services/services_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  configureRoutes(AppRouter.router);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: ScreenUtilInit(
          designSize: const Size(492, 948),
          minTextAdapt: true,
          builder: (context, child) {
            return MaterialApp(
              title: 'Users Managment',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
                useMaterial3: true,
              ),
              onGenerateRoute: AppRouter.router.generator,
              initialRoute: RoutesNames.homePage,
              navigatorKey: SingleInstanceService.navigatorKey,
            );
          }),
    );
  }
}
