import 'package:demo_mobile_shop/domain/entities/cart.dart';
import 'package:demo_mobile_shop/domain/entities/product.dart';
import 'package:demo_mobile_shop/domain/repositories/cart_repository.dart';

class AddToCartUseCase {
  final CartRepository _repository;

  AddToCartUseCase(this._repository);

  Future<Cart> call(Product product, {int quantity = 1}) async {
    final current = await _repository.getCart();
    final updated = current.withProductAdded(product, quantity: quantity);

    if (identical(current, updated)) return current;

    await _repository.saveCart(updated);
    return updated;
  }
}