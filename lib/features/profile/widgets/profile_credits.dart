import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/features/profile/providers/credit_visibility_provider.dart';

/// profile credits
class ProfileCredits extends StatelessWidget {
  const ProfileCredits({super.key});

  @override
  Widget build(BuildContext context) {
    final isHidden = context.watch<CreditVisibilityProvider>().isHidden;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: tertiaryColor, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text("Remaining Credit", style: TextStyle(color: fontWhiteFaded, fontSize: 10)),
                      Icon(Icons.question_mark, color: fontWhiteFaded),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "RM ",
                        style: TextStyle(color: fontYellow, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        isHidden ? "*****" : "50.00",
                        style: TextStyle(color: fontYellow, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              // vertical line
              Container(height: 40, width: 1, color: fontWhiteFaded),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Monthly Credit Limit", style: TextStyle(color: fontWhiteFaded, fontSize: 10)),
                      Row(
                        children: [
                          Text(
                            "RM ",
                            style: TextStyle(color: fontYellow, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            isHidden ? "*****" : "50.00",
                            style: TextStyle(color: fontYellow, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Consumer<CreditVisibilityProvider>(
                    builder: (context, provider, _) => IconButton(
                      icon: Icon(provider.isHidden ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: fontWhiteFaded),
                      onPressed: () {
                        HapticFeedback.lightImpact();
                        provider.toggle();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
