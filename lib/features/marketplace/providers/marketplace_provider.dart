import 'package:flutter/material.dart';
import 'package:setgaji/features/marketplace/models/marketplace_item_model.dart';

class MarketplaceProvider extends ChangeNotifier {
  List<MarketplaceItemModel> _items = MarketplaceItemModel.marketplaceItemList;
  List<MarketplaceItemModel> get items => _items;

  void setItems(List<MarketplaceItemModel> newItems) {
    _items = newItems;
    notifyListeners();
  }

  void toggleItemSelected(MarketplaceItemModel item) {
    final index = _items.indexOf(item);
    if (index != -1) {
      _items[index].isSelected = !_items[index].isSelected;
      notifyListeners();
    }
  }
}
