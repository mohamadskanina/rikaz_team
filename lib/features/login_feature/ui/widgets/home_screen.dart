import 'package:flutter/material.dart';
import 'package:rikaz_team/localization/generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Center(
        child: Text("${Lang.of(context).homeScreen} !!!!"),
      ),
    );
  }
}
