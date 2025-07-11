import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/core/widgets/app_pill.dart';
import 'package:setgaji/features/profile/models/member_benefits_model.dart';
import 'package:setgaji/features/profile/widgets/normal_list.dart';

class ProfileBenefitSection extends StatelessWidget {
  const ProfileBenefitSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(children: const [_SectionHeader(), SizedBox(height: 12), _PlanBenefitList(), SizedBox(height: 12), _MemberBenefitSection(), SizedBox(height: 12), _TipsBanner()]),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 12.0, bottom: 0.0),
      child: Row(
        children: [
          Image.asset("assets/images/core_logo.png", height: 20),
          SizedBox(width: 8),
          Text("Core Plan's Benefit", style: TextStyle(fontSize: 14, color: fontGrey)),
        ],
      ),
    );
  }
}

class _PlanBenefitList extends StatelessWidget {
  const _PlanBenefitList();

  void _onTap() {
    HapticFeedback.lightImpact();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NormalList(
          title: "Payday League",
          trailing: AppPill(
            child: Text(
              "Join Now",
              style: TextStyle(color: fontWhite, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          onTap: _onTap,
        ),
        Divider(height: 20, thickness: 1, color: dividerColor),
        NormalList(
          title: "My Rewards",
          trailing: Text(
            "Basic",
            style: TextStyle(color: fontGrey, fontWeight: FontWeight.bold, fontSize: 12),
          ),
          badgeCount: 3,
          onTap: _onTap,
        ),
        Divider(height: 20, thickness: 1, color: dividerColor),
      ],
    );
  }
}

class _MemberBenefitSection extends StatelessWidget {
  const _MemberBenefitSection();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Member Benefits",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: fontBlue),
            ),
          ),
        ),
        _MemberBenefitHorizontalList(),
      ],
    );
  }
}

class _MemberBenefitHorizontalList extends StatelessWidget {
  const _MemberBenefitHorizontalList();
  @override
  Widget build(BuildContext context) {
    final memberBenefits = MemberBenefitsModel.getMemberBenefits();
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: memberBenefits.length,
        padding: const EdgeInsets.only(left: 24.0, right: 5.0, top: 12.0, bottom: 12.0),
        separatorBuilder: (_, __) => const SizedBox(width: 5),
        itemBuilder: (context, index) {
          final benefit = memberBenefits[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  border: Border.all(color: dividerColor),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(benefit.icon, size: 25, color: secondaryColor),
                ),
              ),
              const SizedBox(height: 5),
              Text(
                benefit.title,
                style: const TextStyle(fontSize: 10, color: fontGrey),
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TipsBanner extends StatelessWidget {
  const _TipsBanner();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: bannerColor,
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
        child: Center(
          child: Text(
            "Tips: Guarantee winner among you and your colleagues.",
            style: TextStyle(fontSize: 12, color: fontGrey),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
