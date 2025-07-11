import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/core/widgets/app_footer.dart';
import 'package:setgaji/features/profile/providers/credit_visibility_provider.dart';
import 'package:setgaji/features/profile/providers/user_profile_provider.dart';
import 'package:setgaji/features/profile/widgets/profile_benefit_section.dart';
import 'package:setgaji/features/profile/widgets/profile_detail_section.dart';
import 'package:setgaji/features/profile/widgets/profile_header_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CreditVisibilityProvider()),
        ChangeNotifierProvider(create: (_) => UserProfileProvider()),
      ],
      child: Scaffold(
        appBar: AppBar(backgroundColor: primaryColor, elevation: 0, toolbarHeight: 0),
        body: SafeArea(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ProfileHeaderSection(), // blue
                        ProfileDetailSection(), // profile info
                        const SizedBox(height: 15),
                        const Divider(height: 0, thickness: 5, color: dividerColor),
                        ProfileBenefitSection(), // plan, benefits
                        const AppFooter(),
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
