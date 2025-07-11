import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/features/profile/providers/credit_visibility_provider.dart';
import 'package:setgaji/features/profile/providers/user_profile_provider.dart';

// profile credits
class ProfileCredits extends StatelessWidget {
  const ProfileCredits({super.key});

  @override
  Widget build(BuildContext context) {
    final isHidden = context.watch<CreditVisibilityProvider>().isHidden;
    final userProfile = context.read<UserProfileProvider>().userProfile;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: tertiaryColor, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Remaining Credit", style: TextStyle(color: fontWhiteFaded, fontSize: 10)),
                        const SizedBox(width: 5),
                        Icon(HugeIcons.strokeRoundedHelpCircle, color: fontWhiteFaded, size: 16),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "RM ",
                          style: TextStyle(color: fontYellow, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          isHidden ? "*****" : userProfile.remainingCredit.toStringAsFixed(2),
                          style: TextStyle(color: fontYellow, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 40, width: 1, color: dividerColor),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("Monthly Credit Limit", style: TextStyle(color: fontWhiteFaded, fontSize: 10)),
                        Row(
                          children: [
                            Text(
                              "RM ",
                              style: TextStyle(color: fontYellow, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              isHidden ? "*****" : userProfile.creditLimit.toStringAsFixed(2),
                              style: TextStyle(color: fontYellow, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Consumer<CreditVisibilityProvider>(
                    builder: (context, provider, _) => IconButton(
                      icon: Icon(provider.isHidden ? HugeIcons.strokeRoundedViewOff : HugeIcons.strokeRoundedView, color: fontWhiteFaded, size: 20),
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        provider.toggle();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
