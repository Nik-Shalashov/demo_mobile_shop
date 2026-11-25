import 'package:demo_mobile_shop/domain/entities/product.dart';

class CatalogResult {
  final List<Product> products;
  final bool isFromCache;

  const CatalogResult({
    required this.products,
    required this.isFromCache,
  });

  const CatalogResult.network(this.products) : isFromCache = false;
  const CatalogResult.cache(this.products) : isFromCache = true;
}