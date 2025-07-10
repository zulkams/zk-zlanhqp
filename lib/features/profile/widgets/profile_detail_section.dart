import 'package:flutter/material.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/features/profile/widgets/expandable_list.dart';

class ProfileDetailSection extends StatelessWidget {
  const ProfileDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: backgroundWhite, child: buildProfileList());
  }

  Widget buildProfileList() {
    return Column(
      children: [
        const ExpandableList(
          title: "My Profile",
          trailing: Text(
            "KYC Verified",
            style: TextStyle(color: fontJadeGreen, fontWeight: FontWeight.bold),
          ),
          children: [],
        ),
        // horizontal line
        const Divider(height: 20, thickness: 1, color: dividerColor),
        const ExpandableList(
          title: "Company Profile",
          trailing: Text(
            "Active",
            style: TextStyle(color: fontJadeGreen, fontWeight: FontWeight.bold),
          ),
          children: [],
        ),
      ],
    );
  }
}
