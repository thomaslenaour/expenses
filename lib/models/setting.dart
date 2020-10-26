import 'package:flutter/material.dart';

class SettingsModel extends ChangeNotifier {
  static bool isDollar = false;

  bool get getCurrency => isDollar;

  set changeCurrency(bool isDollar) {
    isDollar = isDollar ? false : true;
  }
}
