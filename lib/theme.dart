import 'package:flutter/material.dart';
import 'theme_extension.dart';

class AppThemeData {
  static ThemeData lightTheme(bool useMaterial3, Color color) {
    return ThemeData(
      colorSchemeSeed: color,
      brightness: Brightness.light,
      useMaterial3: useMaterial3,
      appBarTheme: AppBarTheme(
        backgroundColor: color,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      extensions: <ThemeExtension>[lightExt],
    );
  }

  static ThemeData darkTheme(bool useMaterial3, Color color) {
    return ThemeData(
      colorSchemeSeed: color,
      brightness: Brightness.dark,
      useMaterial3: useMaterial3,
      appBarTheme: AppBarTheme(
        backgroundColor: color,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      extensions: <ThemeExtension>[darkExt],
    );
  }
}
