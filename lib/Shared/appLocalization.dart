import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'appLocalizationDelegate.dart';

class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  var _localizationStrings;

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('lang/${locale.languageCode}.json');
    _localizationStrings = json.decode(jsonString);
    return true;
  }

  String translate(List keys) {
    if (keys.length == 0) {
      return '';
    }
    var l = _localizationStrings;
    for (var key in keys) {
      l = l[key];
    }
    return l;
  }

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      AppLocalizationDelegate();
}
