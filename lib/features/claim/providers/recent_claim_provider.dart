import 'package:flutter/material.dart';

import '../models/recent_claim_model.dart';

class RecentClaimProvider extends ChangeNotifier {
  RecentClaimModel _recentClaim = RecentClaimModel.recentClaim;
  RecentClaimModel get recentClaim => _recentClaim;

  void setRecentClaim(RecentClaimModel claim) {
    _recentClaim = claim;
    notifyListeners();
  }

  // Optionally, initialize with mock data
  void loadMockClaim() {
    _recentClaim = RecentClaimModel.recentClaim;
    notifyListeners();
  }
}
