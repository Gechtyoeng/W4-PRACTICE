import 'package:flutter/material.dart';
import 'package:w4_practice/1_color_app/color_app.dart';

class ColorService extends ChangeNotifier {
  final Map<CardType, int> _tapCounts = {};

  //Constructor
  ColorService() {
    for (var type in CardType.values) {
      _tapCounts[type] = 0;
    }
  }

  Map<CardType, int> get tapCounts => _tapCounts;

  void onIncrementTap(CardType cardType) {
    _tapCounts[cardType] = _tapCounts[cardType]! + 1;
    notifyListeners();
  }
}
