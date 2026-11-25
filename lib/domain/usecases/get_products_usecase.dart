import 'package:demo_mobile_shop/domain/entities/catalog_result.dart';
import 'package:demo_mobile_shop/domain/repositories/product_repository.dart';

class GetProductsUseCase {
  final ProductRepository _repository;

  GetProductsUseCase(this._repository);

  Future<CatalogResult> call() => _repository.getProducts();
}