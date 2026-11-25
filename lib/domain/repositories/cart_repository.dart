import 'package:demo_mobile_shop/domain/entities/cart.dart';

abstract class CartRepository {
  Future<Cart> getCart();

  Future<void> saveCart(Cart cart);
}