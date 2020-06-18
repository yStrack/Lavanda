import 'package:flutter/material.dart';
import 'package:lavanda/Shared/appLocalization.dart';

class AppTranslate {
  final BuildContext context;

  AppTranslate(this.context);

  String text(List key) {
    return AppLocalization.of(context).translate(key);
  }
}
