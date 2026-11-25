import 'package:demo_mobile_shop/domain/entities/catalog_result.dart';
import 'package:demo_mobile_shop/domain/entities/product.dart';

abstract class ProductRepository {
  Future<CatalogResult> getProducts();

  Future<Product> getProduct(int id);
}