import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/core/widgets/app_icon_button.dart';
import 'package:setgaji/core/widgets/custom_inverted_radius.dart';
import 'package:setgaji/features/profile/providers/user_profile_provider.dart';

// custom gray appbar
class AppGrayAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppGrayAppBar({super.key, required this.title});
  final String title;

  void _onButtonPressed() {
    //
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = context.read<UserProfileProvider>().userProfile;
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            title,
            style: const TextStyle(color: fontBlack, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          _TripleDots(),
        ],
      ),
      leading: _AppDropdownLeading(),
      leadingWidth: 100,
      actions: [
        AppIconButton(icon: HugeIcons.strokeRoundedNotification01, onPressed: _onButtonPressed, borderless: true, buttonSize: 50),
        const SizedBox(width: 5),
        AppIconButton(icon: HugeIcons.strokeRoundedGift, onPressed: _onButtonPressed, borderless: true, buttonSize: 50, badgeCount: userProfile.myRewards.rewardCount),
      ],
      actionsPadding: EdgeInsets.only(right: 18),
      backgroundColor: quaternaryColor,
      surfaceTintColor: Colors.transparent,
      toolbarHeight: 100,
      shape: CustomInvertedRadius(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _AppDropdownLeading extends StatelessWidget {
  const _AppDropdownLeading();

  void _onButtonPressed() {
    HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    final userProfile = context.read<UserProfileProvider>().userProfile;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: InkWell(
        onTap: () => _onButtonPressed(),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: backgroundWhite,
                shape: BoxShape.circle,
                border: Border.all(color: dividerColor, width: 1),
              ),
              alignment: Alignment.center,
              child: Image.asset("assets/images/${userProfile.companyLogo}", height: 40),
            ),
            Icon(HugeIcons.strokeRoundedArrowDown01, size: 18),
          ],
        ),
      ),
    );
  }
}

class _TripleDots extends StatelessWidget {
  const _TripleDots();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(color: fontGreyLight, shape: BoxShape.circle),
          ),
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(color: fontJadeGreen, shape: BoxShape.circle),
          ),
          Container(
            width: 7,
            height: 7,
            decoration: const BoxDecoration(color: fontGreyLight, shape: BoxShape.circle),
          ),
        ],
      ),
    );
  }
}
