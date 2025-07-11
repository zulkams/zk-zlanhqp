class UserProfileModel {
  final String name;
  final String company;
  final String companyLogo;
  final int kycStatus;
  final double remainingCredit;
  final double creditLimit;
  final int companyStatus;

  final int profilePlan;
  final MyRewardsModel myRewards;

  UserProfileModel({
    required this.name,
    required this.company,
    required this.companyLogo,
    required this.kycStatus,
    required this.remainingCredit,
    required this.creditLimit,
    required this.companyStatus,
    required this.profilePlan,
    required this.myRewards,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) => UserProfileModel(
    name: json["name"],
    company: json["company"],
    companyLogo: json["companyLogo"],
    kycStatus: json["kycStatus"],
    remainingCredit: json["remainingCredit"],
    creditLimit: json["creditLimit"],
    companyStatus: json["companyStatus"],
    profilePlan: json["profilePlan"],
    myRewards: MyRewardsModel.fromJson(json["myRewards"]),
  );

  static const userProfileJson = {
    "name": "Zulkamal",
    "company": "Malaysia Company Sdn Bhd",
    "companyLogo": "company_logo.png",
    "kycStatus": 1,
    "remainingCredit": 50.00,
    "creditLimit": 50.00,
    "companyStatus": 1,
    "profilePlan": 1,
    "myRewards": {"rewardTier": 1, "rewardCount": 3},
  };

  static final userProfile = UserProfileModel.fromJson(userProfileJson);
}

class MyRewardsModel {
  final int rewardTier;
  final int rewardCount;

  MyRewardsModel({required this.rewardTier, required this.rewardCount});

  factory MyRewardsModel.fromJson(Map<String, dynamic> json) => MyRewardsModel(rewardTier: json["rewardTier"], rewardCount: json["rewardCount"]);
}
