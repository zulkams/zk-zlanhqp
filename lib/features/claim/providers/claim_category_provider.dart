import 'package:flutter/material.dart';

class ClaimCategoryProvider extends ChangeNotifier {
  int? _selectedIndex;
  int? get selectedIndex => _selectedIndex;

  void selectCategory(int index) {
    // reset selection
    if (_selectedIndex == index) {
      _selectedIndex = null;
    } else {
      _selectedIndex = index;
    }
    notifyListeners();
  }
}
