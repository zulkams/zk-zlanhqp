class RecentClaimModel {
  final String label;
  final double amount;
  final String date;
  final int status;
  const RecentClaimModel({required this.label, required this.amount, required this.date, required this.status});

  factory RecentClaimModel.fromJson(Map<String, dynamic> json) => RecentClaimModel(label: json["label"], amount: json["amount"], date: json["date"], status: json["status"]);

  // mock
  static const recentClaimJson = {"label": "Medical Claim", "amount": 80.00, "date": "2025-06-10T00:00:00.000Z", "status": 0};
  static final recentClaim = RecentClaimModel.fromJson(recentClaimJson);
}