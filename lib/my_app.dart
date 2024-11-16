import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rikaz_team/core/services/services_locator.dart';
import 'package:rikaz_team/core/widgets/toast.dart';
import 'package:rikaz_team/features/login_feature/logic/bloc/login_bloc.dart';
import 'package:rikaz_team/routes/router_screens.dart';
import 'package:rikaz_team/routes/routes_name.dart';
import 'package:toastification/toastification.dart';

import 'features/offline_mode_ui/controller/internet_cubit.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // @override
  // void dispose() {
  //   _connectivitySubscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: ScreenUtilInit(
          designSize: const Size(492, 948),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MultiBlocProvider(
              providers: [
                BlocProvider(
                  create: (context) => InternetCubit(),
                  lazy: false,
                ),
                BlocProvider(create: (context) => sl<LoginBloc>()),
              ],
              child: MaterialApp(
                title: 'Users Managment',
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(
                      seedColor: Colors.blue,
                    ),
                    primaryColor: const Color(0xFF247CFF),
                    scaffoldBackgroundColor: Colors.white,
                    cardColor: Colors.blue.shade50,
                    useMaterial3: true),
                onGenerateRoute: AppRouter.router.generator,
                initialRoute: RoutesNames.login,
                navigatorKey: SingleInstanceService.navigatorKey,
                builder: (context, child) {
                  return BlocListener<InternetCubit, InternetState>(
                    listener: (context, state) {
                      if (state.isConnected) {
                        InternetToast.online(context);
                      } else {
                        InternetToast.offline(context);
                      }
                    },
                    child: child,
                  );
                },
              ),
            );
          }),
    );
  }
}
