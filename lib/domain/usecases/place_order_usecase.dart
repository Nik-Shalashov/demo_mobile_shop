import 'package:demo_mobile_shop/domain/entities/cart.dart';
import 'package:demo_mobile_shop/domain/entities/checkout_exceptions.dart';
import 'package:demo_mobile_shop/domain/entities/order_result.dart';
import 'package:demo_mobile_shop/domain/repositories/cart_repository.dart';
import 'package:demo_mobile_shop/domain/repositories/checkout_repository.dart';
import 'package:demo_mobile_shop/domain/services/order_number_generator.dart';

class PlaceOrderUseCase {
  final CheckoutRepository _checkoutRepository;
  final CartRepository _cartRepository;
  final OrderNumberGenerator _orderNumberGenerator;

  PlaceOrderUseCase({
    required this._checkoutRepository,
    required this._cartRepository,
    required this._orderNumberGenerator,
  });

  Future<OrderResult> call() async {
    final cart = await _cartRepository.getCart();

    if (cart.isEmpty) {
      throw const EmptyCartException();
    }

    await _checkoutRepository.submitOrder(cart.items);

    final orderNumber = _orderNumberGenerator.generate();

    final result = OrderResult(
      orderNumber: orderNumber,
      completedAt: DateTime.now(),
      total: cart.total,
      itemCount: cart.totalQuantity,
    );

    await _cartRepository.saveCart(Cart.empty);

    return result;
  }
}