import 'package:flutter/material.dart';
import 'package:gizu_github_app/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = AppTheme.appThemeLight();

  ThemeData get currentTheme => _currentTheme;

  void switchTheme() {
    _currentTheme = _currentTheme == AppTheme.appThemeLight()
        ? AppTheme.appThemeDark()
        : AppTheme.appThemeLight();
    notifyListeners();
  }
}