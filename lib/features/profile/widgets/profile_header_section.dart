import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
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
        gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [primaryColor, secondaryColor]),
      ),
      child: buildProfileHeaderSection(context),
    );
  }

  Widget buildProfileHeaderSection(BuildContext context) {
    return Center(
      child: Column(
        children: [
          buildTopSection(context),
          // TODO: change to image
          Icon(Icons.star, color: fontWhite, size: 50),
          const SizedBox(height: 5),
          Text(
            "Zulkamal",
            style: TextStyle(color: fontWhite, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text("Malaysia Company Sdn Bhd", style: TextStyle(color: fontWhiteFaded, fontSize: 14)),
          const SizedBox(height: 5),
          // pill container
          buildKYCBadge(),
          const SizedBox(height: 20),
          const ProfileCredits(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  Widget buildTopSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 12, bottom: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // TODO: change icon later
          IconButton(
            onPressed: () {
              HapticFeedback.lightImpact();
              context.pop();
            },
            icon: Icon(Icons.close_rounded, color: fontWhite, size: 30),
          ),
          Icon(Icons.settings_rounded, color: fontWhite, size: 30),
        ],
      ),
    );
  }

  Widget buildKYCBadge() {
    return AppPill(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check_circle, color: fontWhite, size: 14),
          const SizedBox(width: 5),
          const Text(
            "KYC Verified",
            style: TextStyle(color: fontWhite, fontSize: 10, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
