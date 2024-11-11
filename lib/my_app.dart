import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rikaz_team/core/services/services_locator.dart';
import 'package:rikaz_team/features/login_feature/logic/bloc/login_bloc.dart';
import 'package:rikaz_team/routes/router_screens.dart';
import 'package:rikaz_team/routes/routes_name.dart';
import 'package:toastification/toastification.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: ScreenUtilInit(
          designSize: const Size(492, 948),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return BlocProvider(
              create: (context) => sl<LoginBloc>(),
              child: MaterialApp(
                title: 'Users Managment',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    primaryColor: const Color(0xFF247CFF),
                    scaffoldBackgroundColor: Colors.white,
                    useMaterial3: true),
                onGenerateRoute: AppRouter.router.generator,
                initialRoute: RoutesNames.homePage,
                navigatorKey: SingleInstanceService.navigatorKey,
              ),
            );
          }),
    );
  }
}
