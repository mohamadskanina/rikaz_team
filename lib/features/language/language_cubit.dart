import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  LanguageCubit() : super(LanguageState()){
    emit(state.copyWith(supportedLanguages: _supportedLanguages));
  }


  void changeLanguageTo(String code)  {
    emit(state.copyWith(locale: Locale(code)));
  }

  List<SupportedLanguage> get _supportedLanguages {
    return [
      SupportedLanguage(
        langName: 'Arabic',
        langCode: 'ar',
        countryCode: 'SY',
      ),
      SupportedLanguage(
        langName: 'English',
        langCode: 'en',
        countryCode: 'US',
      )
    ];
  }

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    try {
      return LanguageState(locale: Locale(json['code']));
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    return {'code': state.locale.languageCode};
  }
}

class SupportedLanguage {
  final String langName;
  final String langCode;
  final String countryCode;

  SupportedLanguage({
    required this.langName,
    required this.langCode,
    required this.countryCode,
  });
}
