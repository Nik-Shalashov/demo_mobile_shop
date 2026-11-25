import 'package:demo_mobile_shop/domain/entities/product.dart';
import 'package:demo_mobile_shop/domain/repositories/product_repository.dart';

class GetProductUseCase {
  final ProductRepository _repository;

  GetProductUseCase(this._repository);

  Future<Product> call(int id) => _repository.getProduct(id);
}