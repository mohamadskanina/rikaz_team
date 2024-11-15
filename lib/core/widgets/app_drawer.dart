import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rikaz_team/features/language/language_cubit.dart';
import 'package:rikaz_team/features/language/language_state.dart';
import 'package:rikaz_team/localization/generated/l10n.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              Lang.current.userListTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {},
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Language',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          BlocBuilder<LanguageCubit, LanguageState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: DropdownField(
                  languages:
                      state.supportedLanguages!.map((e) => e.langCode).toList(),
                  selectedValue: state.locale.languageCode,
                  onChanged: (code) {
                    if (code != state.locale.languageCode && code != null) {
                      context.read<LanguageCubit>().changeLanguageTo(code);
                    }
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DropdownField extends StatefulWidget {
  final List<String> languages;
  final String? selectedValue;
  final void Function(String?)? onChanged;
  const DropdownField({required this.languages, this.onChanged, super.key, this.selectedValue});

  @override
  _DropdownFieldState createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      items: widget.languages.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
        setState(() {
          selectedValue = newValue;
        });
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
