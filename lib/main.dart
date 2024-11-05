import 'package:flutter/material.dart';
import 'package:rikaz_team/features/login_feature/ui/login_screen.dart';

void main()

import 'core/services/services_locator.dart';
import 'features/users_list/presentation/screens/view_users_list.dart';

{
void main() {
  ServicesLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ViewUsersList(),
    );
  }
}
