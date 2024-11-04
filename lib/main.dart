import 'package:flutter/material.dart';
import 'package:rikaz_team/features/login_feature/ui/login_screen.dart';

void main()

{
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}