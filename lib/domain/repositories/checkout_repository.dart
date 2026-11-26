import 'package:demo_mobile_shop/domain/entities/cart_item.dart';

abstract class CheckoutRepository {
  Future<void> submitOrder(List<CartItem> items);
}