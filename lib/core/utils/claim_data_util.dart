import 'package:flutter/material.dart';
import 'package:setgaji/core/constants/app_colors.dart';

extension ClaimDataUtil on int {
  Color get color {
    switch (this) {
      case 0:
        return statusPending;
      case 1:
        return statusApproved;
      case 2:
        return statusRejected;
      default:
        return statusPending;
    }
  }

  String get claimStatusString {
    switch (this) {
      case 0:
        return 'Pending';
      case 1:
        return 'Approved';
      case 2:
        return 'Rejected';
      default:
        return 'Pending';
    }
  }
}
