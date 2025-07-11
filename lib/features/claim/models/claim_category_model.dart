import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class ClaimCategoryModel {
  final String label;
  final IconData icon;
  const ClaimCategoryModel({required this.label, required this.icon});

  // mock
  static const List<ClaimCategoryModel> categories = [
    ClaimCategoryModel(label: "Medical &\nHealth", icon: HugeIcons.strokeRoundedStethoscope02),
    ClaimCategoryModel(label: "Travel &\nTransportation", icon: HugeIcons.strokeRoundedCar01),
    ClaimCategoryModel(label: "Office\nExpenses", icon: HugeIcons.strokeRoundedPencil),
    ClaimCategoryModel(label: "Meal &\nEntertainment", icon: HugeIcons.strokeRoundedServingFood),
    ClaimCategoryModel(label: "Training &\nDevelopment", icon: HugeIcons.strokeRoundedBook02),
    ClaimCategoryModel(label: "Others", icon: HugeIcons.strokeRoundedMore),
    ClaimCategoryModel(label: "Expenses", icon: HugeIcons.strokeRoundedDollarSquare),
    ClaimCategoryModel(label: "Hotel & Stay", icon: HugeIcons.strokeRoundedHouse02),
  ];
}
