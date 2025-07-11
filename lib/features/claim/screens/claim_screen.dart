import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/core/widgets/app_bottom_buttons.dart';
import 'package:setgaji/core/widgets/app_footer.dart';
import 'package:setgaji/core/widgets/app_gray_appbar.dart';
import 'package:setgaji/features/claim/providers/claim_category_provider.dart';
import 'package:setgaji/features/claim/widgets/claim_category.dart';
import 'package:setgaji/features/claim/widgets/claim_recent.dart';

// for claim
class ClaimScreen extends StatelessWidget {
  const ClaimScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppGrayAppBar(title: 'Claim'),
      body: ChangeNotifierProvider(
        create: (_) => ClaimCategoryProvider(),
        child: SafeArea(child: _ClaimScreenContent()),
      ),
    );
  }
}

class _ClaimScreenContent extends StatelessWidget {
  const _ClaimScreenContent();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 12),
          _ClaimScreenTitle(),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(physics: BouncingScrollPhysics(), child: ClaimCategory()),
          ),
          ClaimRecent(),
          SizedBox(height: 20),
          _ClaimScreenBottomArea(),
        ],
      ),
    );
  }
}

// tite section
class _ClaimScreenTitle extends StatelessWidget {
  const _ClaimScreenTitle();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Select category to continue',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: fontBlack),
      ),
    );
  }
}

// bttom section
class _ClaimScreenBottomArea extends StatelessWidget {
  const _ClaimScreenBottomArea();

  void _onContinuePressed() {
    HapticFeedback.lightImpact();
  }

  // if claim category is selected, continue button is enabled
  bool _isContinueButtonEnabled(BuildContext context) {
    final selectedIndex = context.watch<ClaimCategoryProvider>().selectedIndex;
    return selectedIndex != null;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBottomButtons(middleButtonTitle: 'Continue', onMiddleButtonPressed: _onContinuePressed, disabled: !_isContinueButtonEnabled(context)),
        SizedBox(height: 16),
        AppFooter(),
      ],
    );
  }
}
