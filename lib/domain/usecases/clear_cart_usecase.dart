import 'package:demo_mobile_shop/domain/entities/cart.dart';
import 'package:demo_mobile_shop/domain/repositories/cart_repository.dart';

class ClearCartUseCase {
  final CartRepository _repository;

  ClearCartUseCase(this._repository);

  Future<Cart> call() async {
    final current = await _repository.getCart();
    if (current.isEmpty) return current;

    const empty = Cart.empty;
    await _repository.saveCart(empty);
    return empty;
  }
}