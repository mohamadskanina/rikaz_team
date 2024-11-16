// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class Lang {
  Lang();

  static Lang? _current;

  static Lang get current {
    assert(_current != null,
        'No instance of Lang was loaded. Try to initialize the Lang delegate before accessing Lang.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<Lang> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = Lang();
      Lang._current = instance;

      return instance;
    });
  }

  static Lang of(BuildContext context) {
    final instance = Lang.maybeOf(context);
    assert(instance != null,
        'No instance of Lang present in the widget tree. Did you add Lang.delegate in localizationsDelegates?');
    return instance!;
  }

  static Lang? maybeOf(BuildContext context) {
    return Localizations.of<Lang>(context, Lang);
  }

  /// `English Language`
  String get englishLanguage {
    return Intl.message(
      'English Language',
      name: 'englishLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Arabic Language`
  String get arabicLanguage {
    return Intl.message(
      'Arabic Language',
      name: 'arabicLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `User management`
  String get userListTitle {
    return Intl.message(
      'User management',
      name: 'userListTitle',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Update Users Info`
  String get updateUsersInfo {
    return Intl.message(
      'Update Users Info',
      name: 'updateUsersInfo',
      desc: '',
      args: [],
    );
  }

  /// `Rikaz Company`
  String get rikazCompany {
    return Intl.message(
      'Rikaz Company',
      name: 'rikazCompany',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message(
      'Date',
      name: 'date',
      desc: '',
      args: [],
    );
  }

  /// `Users List`
  String get usersList {
    return Intl.message(
      'Users List',
      name: 'usersList',
      desc: '',
      args: [],
    );
  }

  /// `Total Users is`
  String get totalUsers {
    return Intl.message(
      'Total Users is',
      name: 'totalUsers',
      desc: '',
      args: [],
    );
  }

  /// `Print`
  String get print {
    return Intl.message(
      'Print',
      name: 'print',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Back online`
  String get backOnline {
    return Intl.message(
      'Back online',
      name: 'backOnline',
      desc: '',
      args: [],
    );
  }

  /// `You are offline`
  String get youAreOffline {
    return Intl.message(
      'You are offline',
      name: 'youAreOffline',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account?',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid password`
  String get invalidPassword {
    return Intl.message(
      'Please enter a valid password',
      name: 'invalidPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email`
  String get invalidEmail {
    return Intl.message(
      'Please enter a valid email',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Home Screen`
  String get homeScreen {
    return Intl.message(
      'Home Screen',
      name: 'homeScreen',
      desc: '',
      args: [],
    );
  }

  /// `Login User Successfully`
  String get loginSuccess {
    return Intl.message(
      'Login User Successfully',
      name: 'loginSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Go To Home`
  String get goToHome {
    return Intl.message(
      'Go To Home',
      name: 'goToHome',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcomeBack {
    return Intl.message(
      'Welcome Back',
      name: 'welcomeBack',
      desc: '',
      args: [],
    );
  }

  /// `We're excited to have you back, can't wait to see what you've been up to since you last logged in.`
  String get welcomeBackMessage {
    return Intl.message(
      'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
      name: 'welcomeBackMessage',
      desc: '',
      args: [],
    );
  }

  /// `Create User`
  String get createUser {
    return Intl.message(
      'Create User',
      name: 'createUser',
      desc: '',
      args: [],
    );
  }

  /// `Create User Successfully!`
  String get createUserSuccess {
    return Intl.message(
      'Create User Successfully!',
      name: 'createUserSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Got it`
  String get gotIt {
    return Intl.message(
      'Got it',
      name: 'gotIt',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Please check connection and retry`
  String get checkConnection {
    return Intl.message(
      'Please check connection and retry',
      name: 'checkConnection',
      desc: '',
      args: [],
    );
  }

  /// `Currently offline, showing cached data`
  String get offlineCachedData {
    return Intl.message(
      'Currently offline, showing cached data',
      name: 'offlineCachedData',
      desc: '',
      args: [],
    );
  }

  /// `Please enter correct email`
  String get enterValidEmail {
    return Intl.message(
      'Please enter correct email',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter First Name`
  String get enterFirstName {
    return Intl.message(
      'Please enter First Name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter Last Name`
  String get enterLastName {
    return Intl.message(
      'Please enter Last Name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Success update user info`
  String get updateUserSuccess {
    return Intl.message(
      'Success update user info',
      name: 'updateUserSuccess',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Lang> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
      Locale.fromSubtags(languageCode: 'ar', countryCode: 'SY'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<Lang> load(Locale locale) => Lang.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
