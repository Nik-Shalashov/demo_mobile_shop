import 'package:demo_mobile_shop/domain/entities/cart.dart';
import 'package:demo_mobile_shop/domain/repositories/cart_repository.dart';

class GetCartUseCase {
  final CartRepository _repository;

  GetCartUseCase(this._repository);

  Future<Cart> call() => _repository.getCart();
}