import 'package:flutter/material.dart';

class AppTheme {
  static const fourteen = TextStyle(
    fontSize: 14,
  );
  static const fourteenBold = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  static const twenty = TextStyle(
    fontSize: 20,
  );
  static const twentyBold = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const fourteenGray = TextStyle(fontSize: 14, color: gray);

  static const white = Color.fromRGBO(255, 255, 255, 1);
  static const black = Color.fromRGBO(0, 0, 0, 1);
  static const gray = Color.fromRGBO(128, 130, 133, 1.0);
  static const backgroundOrange = Color.fromRGBO(124, 96, 85, 1.0);
  static const lightOrange = Color.fromRGBO(255, 145, 91, 1);
  static const veryLightOrange = Color.fromRGBO(253, 186, 164, 1.0);
  static const orange = Color.fromRGBO(239, 98, 3, 1.0);
  static const darkOrange = Color.fromRGBO(75, 25, 0, 1.0);

  static const inputDecorator = InputDecorationTheme(
    border: InputBorder.none,
    focusedErrorBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    hintStyle: fourteenGray,
    labelStyle: fourteen,

    contentPadding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
  );

  static ThemeData appThemeLight() {
    return ThemeData(
      applyElevationOverlayColor: true,
      scaffoldBackgroundColor: white,
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Colors.orange,
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
      ),
      brightness: Brightness.light,
      inputDecorationTheme: inputDecorator,
    );
  }

  static ThemeData appThemeDark() {
    return ThemeData(
      applyElevationOverlayColor: true,
      scaffoldBackgroundColor: backgroundOrange,
      useMaterial3: true,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primarySwatch: Colors.orange,
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
      ),
      brightness: Brightness.dark,
      inputDecorationTheme: inputDecorator,
    );
  }
}