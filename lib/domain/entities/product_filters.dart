import 'package:demo_mobile_shop/domain/entities/price_range.dart';

class ProductFilters {
  final Set<String> categories;
  final PriceRange priceRange;

  const ProductFilters({
    required this.categories,
    required this.priceRange,
  });

  static const empty = ProductFilters(
    categories: {},
    priceRange: PriceRange(),
  );

  bool get isActive => categories.isNotEmpty || !priceRange.isEmpty;

  ProductFilters copyWith({
    Set<String>? categories,
    PriceRange? priceRange,
  }) {
    return ProductFilters(
      categories: categories ?? this.categories,
      priceRange: priceRange ?? this.priceRange,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductFilters &&
          runtimeType == other.runtimeType &&
          _setsEqual(categories, other.categories) &&
          priceRange == other.priceRange;

  @override
  int get hashCode =>
      Object.hash(Object.hashAllUnordered(categories), priceRange);
}

bool _setsEqual(Set<String> a, Set<String> b) {
  if (a.length != b.length) return false;
  return a.containsAll(b);
}