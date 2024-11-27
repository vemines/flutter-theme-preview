# flutter_theme_preview

This is project for learn/preview theme of material app.</br>
Material preview is pure flutter (not provider).</br>

List Material Widget for review:</br>

- Button
- TextField / Switch / Radio / Slider
- ListTile
- Navigator
- Elevation (for display material type card / canva)
- Menu / DropDown
- Dialog / SnackBar / BottomSheet / MaterialBanner
- Other (Icon / Badge / Circle Avatar / ToolTip / Theme Extension / Process Indicator)
- TextStyle

## Current Flutter version

Flutter 3.24.5
Dart 3.5.2 • DevTools 2.37.3

## Before run

Check problems tab in vscode if any deprecated, manual fix it or run dart fix --apply.</br>
If material 3 no longer support, remove it in [Theme Controller](lib/theme_provider.dart), [Custom theme](lib/theme.dart) and [Home Tabbar](lib/home.dart) line 60

## Custom theme

[Custom theme](lib/theme.dart) Custom Light/Dark and default component theme.</br>
[Custom theme extension](lib/theme_extension.dart) Add more custom color to Theme.</br>

## Credit

Almost widget is from Example SubPage Flex Color Scheme

- [Live demo](https://rydmike.com/flexcolorscheme/themesplayground-latest/)
- [pub.dev](https://pub.dev/packages/flex_color_scheme)

And from Example Material 3 of Flutter

- [Live demo](https://flutter.github.io/samples/web/material_3_demo/)
- [Github](https://github.com/flutter/samples/tree/main/material_3_demo)
