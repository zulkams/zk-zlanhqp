import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/core/widgets/app_pill.dart';
import 'package:setgaji/core/widgets/custom_inverted_radius.dart';
import 'package:setgaji/features/profile/widgets/profile_credits.dart';

class ProfileHeaderSection extends StatelessWidget {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: ShapeDecoration(
        shape: CustomInvertedRadius(),
        gradient: const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [primaryColor, secondaryColor]),
      ),
      child: const _ProfileHeaderContent(),
    );
  }
}

class _ProfileHeaderContent extends StatelessWidget {
  const _ProfileHeaderContent();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Center(child: Column(children: const [_ProfileHeaderTopSection(), _ProfileInfoSection(), SizedBox(height: 5), _KYCBadge(), SizedBox(height: 20), ProfileCredits(), SizedBox(height: 32)])),
    );
  }
}

class _ProfileHeaderTopSection extends StatelessWidget {
  const _ProfileHeaderTopSection();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              context.pop();
            },
            icon: const Icon(HugeIcons.strokeRoundedCancel01, color: fontWhite, size: 30),
          ),
          const Icon(HugeIcons.strokeRoundedSettings01, color: fontWhite, size: 30),
        ],
      ),
    );
  }
}

class _ProfileInfoSection extends StatelessWidget {
  const _ProfileInfoSection();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset("assets/images/core_logo.png", height: 60),
        SizedBox(height: 5),
        Text(
          "Zulkamal",
          style: TextStyle(color: fontWhite, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        Text(
          "Malaysia Company Sdn Bhd",
          style: TextStyle(color: fontWhiteFaded, fontSize: 14, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}

class _KYCBadge extends StatelessWidget {
  const _KYCBadge();
  @override
  Widget build(BuildContext context) {
    return AppPill(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(HugeIcons.strokeRoundedKnightShield, color: fontWhite, size: 14),
          SizedBox(width: 5),
          Text(
            "KYC Verified",
            style: TextStyle(color: fontWhite, fontSize: 10, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
