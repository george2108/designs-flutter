import 'package:flutter/material.dart';

class ConfigAppProvider with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;

  ThemeMode get themeMode => _themeMode;

  bool get isDarkMode => _themeMode == ThemeMode.dark;

  changeTheme() {
    _themeMode = isDarkMode ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  set themeMode(ThemeMode themeMode) {
    this._themeMode = themeMode;
    notifyListeners();
  }
}
