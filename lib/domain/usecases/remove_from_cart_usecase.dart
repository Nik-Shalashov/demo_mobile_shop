import 'package:demo_mobile_shop/domain/entities/cart.dart';
import 'package:demo_mobile_shop/domain/repositories/cart_repository.dart';

class RemoveFromCartUseCase {
  final CartRepository _repository;

  RemoveFromCartUseCase(this._repository);

  Future<Cart> call(int productId) async {
    final current = await _repository.getCart();
    final updated = current.withProductRemoved(productId);

    if (identical(current, updated)) return current;

    await _repository.saveCart(updated);
    return updated;
  }
}