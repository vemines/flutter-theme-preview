import 'package:flutter/material.dart';

const successL = Color(0xff4CAF50);
const successD = Color(0xff2E7D32);
const infoL = Color(0xff03A9F4);
const infoD = Color(0xff01579B);
const warningL = Color(0xffFF9800);
const warningD = Color(0xffE65100);
const errorL = Color(0xffD32F2F);
const errorD = Color(0xffC62828);

abstract class ColorThemeExtension {
  Color get warning;
  setWarning(Color value) => warning == value;
  Color get success;
  setSuccess(Color value) => success == value;
  Color get info;
  setInfo(Color value) => info == value;
  Color get error;
  setError(Color value) => error == value;
}

// Named by theme, here is demo 3 extension light/dart/yellow, each can reuse able
class LightThemeExtension extends ColorThemeExtension {
  @override
  Color get warning => warningL;
  @override
  Color get success => successL;
  @override
  Color get info => infoL;
  @override
  Color get error => errorL;
}

class DarkColorThemeExt extends ColorThemeExtension {
  @override
  Color get warning => warningD;
  @override
  Color get success => successD;
  @override
  Color get info => infoD;
  @override
  Color get error => errorD;
}

// another theme extension
// class AnotherColorExtension extends ColorThemeExtension {
//   @override
//   Color get warning => Colors.yellowAccent;
//   @override
//   Color get success => Colors.greenAccent;
//   @override
//   Color get info => Colors.blueAccent;
//   @override
//   Color get error => Colors.redAccent;
// }

class CustomColors extends ThemeExtension<CustomColors> {
  late ColorThemeExtension colorTheme;
  CustomColors({required this.colorTheme});

  @override
  ThemeExtension<CustomColors> copyWith({ColorThemeExtension? colorTheme}) {
    return CustomColors(colorTheme: colorTheme ?? this.colorTheme);
  }

  @override
  ThemeExtension<CustomColors> lerp(
    covariant ThemeExtension<CustomColors>? other,
    double t,
  ) {
    // check instance
    if (other is! CustomColors) return this;

    colorTheme.setWarning(lerpColor(
      colorTheme.warning,
      other.colorTheme.warning,
      t,
    ));
    colorTheme.setSuccess(lerpColor(
      colorTheme.success,
      other.colorTheme.success,
      t,
    ));
    colorTheme.setInfo(lerpColor(
      colorTheme.info,
      other.colorTheme.info,
      t,
    ));
    colorTheme.setError(lerpColor(
      colorTheme.error,
      other.colorTheme.error,
      t,
    ));

    return this;
  }
}

CustomColors lightExt = CustomColors(colorTheme: LightThemeExtension());
CustomColors darkExt = CustomColors(colorTheme: DarkColorThemeExt());
// CustomColors anotherExt = CustomColors(colorTheme: AnotherColorExtension());

Color lerpColor(Color a, Color b, double t) => Color.lerp(a, b, t) ?? a;
