import 'package:demo_mobile_shop/domain/entities/product.dart';
import 'package:demo_mobile_shop/domain/entities/product_filters.dart';

class FilterProductsUseCase {
  const FilterProductsUseCase();

  List<Product> call(List<Product> products, ProductFilters filters) {
    if (!filters.isActive) return products;

    return products.where((product) {
      if (filters.categories.isNotEmpty &&
          !filters.categories.contains(product.category)) {
        return false;
      }
      return filters.priceRange.matches(product.price);
    }).toList();
  }
}