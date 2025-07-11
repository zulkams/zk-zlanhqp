import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/core/utils/profile_data_util.dart';
import 'package:setgaji/features/profile/providers/user_profile_provider.dart';
import 'package:setgaji/features/profile/widgets/expandable_list.dart';

class ProfileDetailSection extends StatelessWidget {
  const ProfileDetailSection({super.key});

  @override
  Widget build(BuildContext context) {
    final userProfile = context.read<UserProfileProvider>().userProfile;
    return Container(
      color: backgroundWhite,
      child: Column(
        children: [
          ExpandableList(
            title: "My Profile",
            trailing: Text(
              "KYC ${userProfile.kycStatus.kycStatusString}",
              style: TextStyle(color: userProfile.kycStatus.kycStatus == KYCStatus.verified ? fontJadeGreen : badgeColor, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          Divider(height: 20, thickness: 1, color: dividerColor),
          ExpandableList(
            title: "Company Profile",
            trailing: Text(
              userProfile.companyStatus.companyStatusString,
              style: TextStyle(color: userProfile.companyStatus.companyStatus == CompanyStatus.active ? fontJadeGreen : badgeColor, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
