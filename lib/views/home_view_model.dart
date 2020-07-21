import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  var _currentIndex = 0;

  int get currentIndex => _currentIndex;

  updateCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
