import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class MemberBenefitsModel {
  final String title;
  final IconData icon;

  MemberBenefitsModel({required this.title, required this.icon});

  static List<MemberBenefitsModel> getMemberBenefits() {
    return [
      MemberBenefitsModel(title: "Early Salary\nWithdraw", icon: HugeIcons.strokeRoundedMoney01),
      MemberBenefitsModel(title: "Advance Salary\nWithdraw", icon: HugeIcons.strokeRoundedWallet03),
      MemberBenefitsModel(title: "Payday League\nRewards", icon: HugeIcons.strokeRoundedChart01),
      MemberBenefitsModel(title: "Withdraw\nRewards", icon: HugeIcons.strokeRoundedCoupon03),
    ];
  }
}
