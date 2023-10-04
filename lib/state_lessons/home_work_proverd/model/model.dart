import 'package:flutter/material.dart';

class HomeWorkProviderModel extends ChangeNotifier {
  bool light = true;

  void lightB() {
    light = !light;
    notifyListeners();
  }
}
