import 'package:demo_mobile_shop/domain/entities/cart.dart';
import 'package:demo_mobile_shop/domain/repositories/cart_repository.dart';

class UpdateCartItemQuantityUseCase {
  final CartRepository _repository;

  UpdateCartItemQuantityUseCase(this._repository);

  Future<Cart> call(int productId, int quantity) async {
    final current = await _repository.getCart();
    final updated = current.withProductQuantity(productId, quantity);

    if (identical(current, updated)) return current;

    await _repository.saveCart(updated);
    return updated;
  }
}