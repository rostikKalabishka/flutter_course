import 'dart:math';

import 'package:flutter/material.dart';

class HomeWorkProviderModel extends ChangeNotifier {
  bool _light = true;
  bool get light => _light;
  Color _color = Color.fromARGB(100, 100, 100, 100);
  Color get color => _color;
  Color _colorAppBar = Color.fromARGB(255, 255, 255, 255);
  Color get colorAppBar => _colorAppBar;

  void randomColors() {
    var formR = (Random().nextDouble() * 255).toInt();
    var formG = (Random().nextDouble() * 255).toInt();
    var formB = (Random().nextDouble() * 255).toInt();

    var formRApp = (Random().nextDouble() * 255).toInt();
    var formGApp = (Random().nextDouble() * 255).toInt();
    var formBApp = (Random().nextDouble() * 255).toInt();
    _color = Color.fromARGB(255, formR, formG, formB);

    _colorAppBar = Color.fromARGB(255, formRApp, formGApp, formBApp);
  }

  void lightB() {
    _light = !_light;
    randomColors();
    notifyListeners();
  }
}
