import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'appLocalizationDelegate.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  Map<String, String> _localizationStrings;

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    _localizationStrings = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String translate(String key) {
    return _localizationStrings[key];
  }

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      AppLocalizationDelegate();
}
