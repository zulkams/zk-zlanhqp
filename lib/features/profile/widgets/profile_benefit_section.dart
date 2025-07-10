import 'package:flutter/material.dart';
import 'package:setgaji/core/constants/app_colors.dart';
import 'package:setgaji/core/widgets/app_pill.dart';
import 'package:setgaji/features/profile/widgets/normal_list.dart';

class ProfileBenefitSection extends StatelessWidget {
  const ProfileBenefitSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(children: [Icon(Icons.star), Text("Core Plan's Benefit")]),
          ),
          SizedBox(height: 12),
          buildPlanBenefitList(), // normal list of benefit
          SizedBox(height: 12),
          buildMemberBenefit(), //member benefits
          SizedBox(height: 12),
          buildTipsBanner(), // banner
        ],
      ),
    );
  }

  Widget buildPlanBenefitList() {
    return Column(
      children: [
        NormalList(
          title: "Payday League",
          trailing: AppPill(
            child: Text(
              "Join Now",
              style: TextStyle(color: fontWhite, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Divider(height: 20, thickness: 1, color: dividerColor),
        NormalList(
          title: "My Rewards",
          trailing: Text(
            "Basic",
            style: TextStyle(color: fontGrey, fontWeight: FontWeight.bold),
          ),
          badgeCount: 3,
        ),
        Divider(height: 20, thickness: 1, color: dividerColor),
      ],
    );
  }

  Widget buildMemberBenefit() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Member Benefits",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: fontBlue),
            ),
          ),
        ),
        buildMemberBenefitHorizontalList(),
      ],
    );
  }

  Widget buildMemberBenefitHorizontalList() {
    // horizontal scroll
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 24.0 : 5.0, right: 5.0, top: 12.0, bottom: 12.0),
            child: SizedBox(
              width: 80,
              height: 130,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: dividerColor),
                      shape: BoxShape.circle,
                    ),
                    child: Padding(padding: const EdgeInsets.all(15.0), child: Icon(Icons.star, size: 40)),
                  ),
                  Text(
                    "Payasdas asdsa sadas",
                    style: TextStyle(fontSize: 12, color: fontGrey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildTipsBanner() {
    return Container(
      width: double.infinity,
      color: bannerColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
        child: Center(
          child: Text("Tips: Guarantee winner among you and your colleagues.", style: TextStyle(fontSize: 12, color: fontGrey)),
        ),
      ),
    );
  }
}
