import 'package:flutter/material.dart';

class ColorService extends ChangeNotifier {
  int _redCounter = 0;
  int _blueCounter = 0;

  int get redCounter => _redCounter;
  int get blueCounter => _blueCounter;

  void onRedCounterTap() {
    _redCounter++;
    notifyListeners();
  }

  void onBlueCounterTap() {
    _blueCounter++;
    notifyListeners();
  }
}
