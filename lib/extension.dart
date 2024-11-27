import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  bool isDarkMode() => Theme.of(this).brightness == Brightness.dark;
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension HomeExtension on List<Widget> {
  Widget wrapBorder(Color color) => Container(
        margin: const EdgeInsets.symmetric(vertical: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: this,
        ),
      );

  List<Widget> separateCenter([bool isCol = true]) => length <= 1
      ? this
      : [
          first,
          ...sublist(1).expand((element) => [
                isCol ? const SizedBox(height: 16) : const SizedBox(width: 16),
                element
              ])
        ];
}
