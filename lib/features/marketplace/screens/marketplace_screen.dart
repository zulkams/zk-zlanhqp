import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/core/utils/price_util.dart';
import 'package:setgaji/core/widgets/app_bottom_buttons.dart';
import 'package:setgaji/core/widgets/app_footer.dart';
import 'package:setgaji/core/widgets/app_gray_appbar.dart';
import 'package:setgaji/features/marketplace/providers/marketplace_provider.dart';
import 'package:setgaji/features/marketplace/widgets/marketplace_item_list.dart';

class MarketplaceScreen extends StatelessWidget {
  const MarketplaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppGrayAppBar(title: 'Marketplace'),
      body: ChangeNotifierProvider(
        create: (_) => MarketplaceProvider(),
        child: SafeArea(child: _MarketplaceScreenContent()),
      ),
    );
  }
}

class _MarketplaceScreenContent extends StatelessWidget {
  const _MarketplaceScreenContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        _MarketplaceScreenSubs(),
        SizedBox(height: 20),
        Divider(height: 0, thickness: 1, color: dividerColor),
        SizedBox(height: 16),
        Expanded(child: MarketplaceItemList()),
        SizedBox(height: 24),
        _MarketplaceScreenBottomArea(),
      ],
    );
  }
}

// marketplace subs
class _MarketplaceScreenSubs extends StatelessWidget {
  const _MarketplaceScreenSubs();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset("assets/images/core_logo.png", height: 20),
              SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Your Subscription", style: TextStyle(fontSize: 14, color: fontGrey)),
                  Text(
                    "Core Plan",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: fontBlack),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("Usable Credit", style: TextStyle(fontSize: 14, color: fontGrey)),
              Text(
                80.00.formatPrice,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: fontBlack),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MarketplaceScreenBottomArea extends StatelessWidget {
  const _MarketplaceScreenBottomArea();

  void _onRedeemPressed() {
    HapticFeedback.lightImpact();
  }

  bool _isRedeemButtonDisabled(BuildContext context) {
    final selectedIndex = context.watch<MarketplaceProvider>().items.where((item) => item.isSelected).isEmpty;
    return selectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppBottomButtons(middleButtonTitle: 'Redeem', onMiddleButtonPressed: _onRedeemPressed, disabled: _isRedeemButtonDisabled(context)),
          SizedBox(height: 16),
          AppFooter(),
        ],
      ),
    );
  }
}
