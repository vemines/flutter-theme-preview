import 'package:flutter/material.dart';
import 'theme.dart';

enum ColorSeed {
  baseColor('M3 Baseline', Color(0xff6750a4)),
  purple('Purple', Colors.purple),
  indigo('Indigo', Colors.indigo),
  blue('Blue', Colors.blue),
  blueAccent('Blue Accent', Colors.blueAccent),
  teal('Teal', Colors.teal),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  orange('Orange', Colors.orange),
  deepOrange('Deep Orange', Colors.deepOrange),
  pink('Pink', Colors.pink);

  const ColorSeed(this.label, this.color);
  final String label;
  final Color color;
}

class ThemeProvider extends ChangeNotifier {
  bool isMaterial3 = true;
  ThemeMode themeMode = ThemeMode.dark;
  ColorSeed colorSeed = ColorSeed.baseColor;

  void triggerMaterialTheme() {
    isMaterial3 = !isMaterial3;
    notifyListeners();
  }

  void changeThemeMode(ThemeMode newThemeMode) {
    themeMode = newThemeMode;
    notifyListeners();
  }

  void changeColorSeed(ColorSeed newColorSeed) {
    colorSeed = newColorSeed;
    notifyListeners();
  }

  ThemeData getCurrentTheme() {
    return themeMode == ThemeMode.dark
        ? AppThemeData.darkTheme(isMaterial3, colorSeed.color)
        : AppThemeData.lightTheme(isMaterial3, colorSeed.color);
  }
}
