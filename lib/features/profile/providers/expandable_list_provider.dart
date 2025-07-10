import 'package:flutter/material.dart';

class ExpandableListProvider extends ChangeNotifier {
  bool expanded = false;
  void toggle() {
    expanded = !expanded;
    notifyListeners();
  }
}
