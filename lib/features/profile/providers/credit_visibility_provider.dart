import 'package:flutter/material.dart';

class CreditVisibilityProvider extends ChangeNotifier {
  bool _isHidden = true;
  bool get isHidden => _isHidden;

  /// toggle credit visibility
  void toggle() {
    _isHidden = !_isHidden;
    notifyListeners();
  }
}
