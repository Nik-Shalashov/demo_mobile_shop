class OrderResult {

  final String orderNumber;

  final DateTime completedAt;

  final double total;

  final int itemCount;

  const OrderResult({
    required this.orderNumber,
    required this.completedAt,
    required this.total,
    required this.itemCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OrderResult &&
          runtimeType == other.runtimeType &&
          orderNumber == other.orderNumber &&
          completedAt == other.completedAt &&
          total == other.total &&
          itemCount == other.itemCount;

  @override
  int get hashCode =>
      Object.hash(orderNumber, completedAt, total, itemCount);
}