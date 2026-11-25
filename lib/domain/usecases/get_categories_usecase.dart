import 'package:demo_mobile_shop/domain/entities/product.dart';

class GetCategoriesUseCase {
  const GetCategoriesUseCase();

  List<String> call(List<Product> products) {
    final unique = <String>{};
    for (final product in products) {
      if (product.category.isNotEmpty) {
        unique.add(product.category);
      }
    }
    final sorted = unique.toList()..sort();
    return sorted;
  }
}