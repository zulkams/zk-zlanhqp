import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:setgaji/core/constants/app_colors.dart';

class RecentClaimModel {
  final String label;
  final double amount;
  final String date;
  final String status;
  const RecentClaimModel({required this.label, required this.amount, required this.date, required this.status});

  // mock
  static const recentClaim = RecentClaimModel(label: "Medical Claim", amount: 80.00, date: "2025-06-10T00:00:00.000Z", status: "Pending");
}

extension ClaimStatusExtension on String {
  Color get color {
    switch (this) {
      case "Pending":
        return statusPending;
      case "Approved":
        return statusApproved;
      case "Rejected":
        return statusRejected;
      default:
        return statusPending;
    }
  }
}
