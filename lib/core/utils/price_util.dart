/// price ext
extension PriceFormatting on double {
  String get formatPrice {
    return "RM ${toStringAsFixed(2)}";
  }
}
