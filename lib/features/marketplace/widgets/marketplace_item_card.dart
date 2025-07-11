import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/core/utils/datetime_util.dart';
import 'package:setgaji/core/widgets/app_pill.dart';
import 'package:setgaji/features/marketplace/models/marketplace_item_model.dart';
import 'package:setgaji/features/marketplace/providers/marketplace_provider.dart';

class MarketplaceItemCard extends StatefulWidget {
  final MarketplaceItemModel item;
  const MarketplaceItemCard({super.key, required this.item});

  @override
  State<MarketplaceItemCard> createState() => _MarketplaceItemCardState();
}

class _MarketplaceItemCardState extends State<MarketplaceItemCard> {
  @override
  Widget build(BuildContext context) {
    final item = widget.item;
    return InkWell(
      onTap: () {
        if (item.stockLeft == 0) return;
        HapticFeedback.lightImpact();
        context.read<MarketplaceProvider>().toggleItemSelected(item);
      },
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxHeight: 130),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: item.isSelected ? Border.all(color: jadeGreen, width: 2) : Border.all(color: dividerColor),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Opacity(
            opacity: item.stockLeft == 0 ? 0.5 : 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Image.asset("assets/images/core_logo.png", height: 60)),
                ),
                //vertical divider
                VerticalDivider(width: 10, color: dividerColor),
                //content
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: ConstrainedBox(
                                    constraints: const BoxConstraints(minWidth: 60),
                                    child: AppPill(
                                      horizontalPadding: 8,
                                      color: item.stockLeft == 0 ? fontGrey : jadeGreen,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            '${item.stockLeft}/${item.stockTotal} left',
                                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                                          ),
                                          if (item.stockLeft == 0) ...[SizedBox(width: 5), Icon(HugeIcons.strokeRoundedHelpCircle, color: Colors.white, size: 14)],
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    if (item.planType == 1) ...[Image.asset("assets/images/core_logo.png", height: 20)] else const SizedBox(width: 20),
                                    const SizedBox(width: 10),
                                    if (item.stockLeft > 0) ...[
                                      SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Checkbox(
                                          value: item.isSelected,
                                          side: const BorderSide(color: dividerColor),
                                          // checked color
                                          activeColor: jadeGreen,
                                          onChanged: (value) {},
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.4,
                              child: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16), maxLines: 2),
                            ),
                          ],
                        ),
                        if (item.stockLeft > 0) ...[
                          Row(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    "RM",
                                    style: const TextStyle(color: jadeGreen, fontWeight: FontWeight.bold, fontSize: 14),
                                  ),
                                  Text(
                                    item.price.toStringAsFixed(2),
                                    style: const TextStyle(color: jadeGreen, fontWeight: FontWeight.bold, fontSize: 22),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'RM${item.maxPrice.toStringAsFixed(2)}',
                                style: const TextStyle(color: fontGrey, fontSize: 12, decoration: TextDecoration.lineThrough),
                              ),
                            ],
                          ),
                        ] else ...[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Expires", style: TextStyle(color: fontGrey, fontSize: 10)),
                                  Text(
                                    item.expiryDate.formatDate,
                                    style: TextStyle(color: fontJadeGreen, fontSize: 12, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              AppPill(
                                color: fontGrey,
                                child: Text(
                                  "Fully Redeem",
                                  style: TextStyle(color: fontWhite, fontWeight: FontWeight.bold, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
