class MarketplaceItemModel {
  final String imageUrl;
  final String name;
  final double price;
  final double maxPrice;
  final int stockLeft;
  final int stockTotal;
  final int planType;
  final String expiryDate;
  bool isSelected;

  MarketplaceItemModel({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.maxPrice,
    required this.stockLeft,
    required this.stockTotal,
    required this.planType,
    required this.expiryDate,
    this.isSelected = false,
  });

  factory MarketplaceItemModel.fromJson(Map<String, dynamic> json) {
    return MarketplaceItemModel(
      imageUrl: json['imageUrl'],
      name: json['name'],
      price: json['price'],
      maxPrice: json['maxPrice'],
      stockLeft: json['stockLeft'],
      stockTotal: json['stockTotal'],
      planType: json['planType'],
      expiryDate: json['expiryDate'],
    );
  }

  static const marketplaceItemJson = [
    {"imageUrl": "", "name": "Jasmine SunWhite 5KG Rice", "price": 35.00, "maxPrice": 38.00, "stockLeft": 90, "stockTotal": 100, "planType": 1, "expiryDate": "2025-06-10T00:00:00.000Z"},
    {"imageUrl": "", "name": "Jasmine SunWhite 5KG Rice", "price": 35.00, "maxPrice": 38.00, "stockLeft": 90, "stockTotal": 100, "planType": 0, "expiryDate": "2025-07-11T00:00:00.000Z"},
    {"imageUrl": "", "name": "Jasmine SunWhite 5KG Rice", "price": 35.00, "maxPrice": 38.00, "stockLeft": 0, "stockTotal": 100, "planType": 0, "expiryDate": "2025-07-11T00:00:00.000Z"},
  ];

  static List<MarketplaceItemModel> get marketplaceItemList => marketplaceItemJson.map((json) => MarketplaceItemModel.fromJson(json)).toList();
}
