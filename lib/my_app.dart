import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rikaz_team/features/users_list/presentation/screens/view_users_list.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: "Rikaz Task",
        // home: BlocProvider(
        //   create: (context) => sl<LoginBloc>(),
        //   child: const LoginScreen(),
        // ),
        home: const ViewUsersList(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF247CFF),
          scaffoldBackgroundColor: Colors.white,
        ),
      ),
    );
  }
}
