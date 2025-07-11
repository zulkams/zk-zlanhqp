import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setgaji/features/marketplace/providers/marketplace_provider.dart';
import 'package:setgaji/features/marketplace/widgets/marketplace_item_card.dart';

class MarketplaceItemList extends StatelessWidget {
  const MarketplaceItemList({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.watch<MarketplaceProvider>().items;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      itemCount: items.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        return MarketplaceItemCard(item: items[index]);
      },
    );
  }
}
