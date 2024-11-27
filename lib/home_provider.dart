import 'package:flutter/material.dart';

List<String> tabName = [
  "Color",
  "Button",
  "Input",
  "ListTile",
  "Navigator",
  "Elevation",
  "Menu",
  "Dialog",
  "Other",
  "Text Style",
];

class HomeProvider extends ChangeNotifier {
  int tabIndex = 1;

  void changeTab(int index) {
    tabIndex = index;
    notifyListeners();
  }
}
