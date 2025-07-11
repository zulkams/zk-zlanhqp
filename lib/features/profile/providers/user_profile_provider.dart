import 'package:flutter/material.dart';

import '../models/user_profile_model.dart';

class UserProfileProvider extends ChangeNotifier {
  UserProfileModel _userProfile = UserProfileModel.userProfile;
  UserProfileModel get userProfile => _userProfile;

  void setUserProfile(UserProfileModel profile) {
    _userProfile = profile;
    notifyListeners();
  }

  // Optionally, add methods to update specific fields
  void updateName(String name) {
    _userProfile = UserProfileModel(
      name: name,
      company: _userProfile.company,
      companyLogo: _userProfile.companyLogo,
      kycStatus: _userProfile.kycStatus,
      remainingCredit: _userProfile.remainingCredit,
      creditLimit: _userProfile.creditLimit,
      companyStatus: _userProfile.companyStatus,
      profilePlan: _userProfile.profilePlan,
      myRewards: _userProfile.myRewards,
    );
    notifyListeners();
  }
}
