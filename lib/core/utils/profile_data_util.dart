enum KYCStatus { verified, notVerified }

enum CompanyStatus { active, inactive }

enum ProfilePlan { core, advanced, ultimate }

enum RewardTier { basic, premium }

extension ProfileDataUtil on int {
  KYCStatus get kycStatus {
    switch (this) {
      case 1:
        return KYCStatus.verified;
      case 0:
      default:
        return KYCStatus.notVerified;
    }
  }

  String get kycStatusString {
    switch (this) {
      case 1:
        return 'Verified';
      case 0:
      default:
        return 'Not Verified';
    }
  }

  CompanyStatus get companyStatus {
    switch (this) {
      case 1:
        return CompanyStatus.active;
      case 0:
      default:
        return CompanyStatus.inactive;
    }
  }

  String get companyStatusString {
    switch (this) {
      case 1:
        return 'Active';
      case 0:
      default:
        return 'Inactive';
    }
  }

  ProfilePlan get profilePlan {
    switch (this) {
      case 1:
        return ProfilePlan.core;
      case 2:
        return ProfilePlan.advanced;
      case 3:
        return ProfilePlan.ultimate;
      default:
        return ProfilePlan.core;
    }
  }

  String get profilePlanString {
    switch (this) {
      case 1:
        return 'Core';
      case 2:
        return 'Advanced';
      case 3:
        return 'Ultimate';
      default:
        return 'Core';
    }
  }

  String get profilePlanIcon {
    switch (this) {
      case 1:
        return 'core_logo.png';
      case 2:
        return 'advanced_logo.png';
      case 3:
        return 'ultimate_logo.png';
      default:
        return 'core_logo.png';
    }
  }

  RewardTier get rewardTier {
    switch (this) {
      case 1:
        return RewardTier.basic;
      case 2:
        return RewardTier.premium;
      default:
        return RewardTier.basic;
    }
  }

  String get rewardTierString {
    switch (this) {
      case 1:
        return 'Basic';
      case 2:
        return 'Premium';
      default:
        return 'Basic';
    }
  }
}
