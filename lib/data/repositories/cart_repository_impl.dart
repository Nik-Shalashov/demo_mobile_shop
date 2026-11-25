import 'package:demo_mobile_shop/data/datasources/local/cart_local_datasource.dart';
import 'package:demo_mobile_shop/domain/entities/cart.dart';
import 'package:demo_mobile_shop/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartLocalDataSource _local;

  CartRepositoryImpl(this._local);

  @override
  Future<Cart> getCart() => _local.getCart();

  @override
  Future<void> saveCart(Cart cart) => _local.saveCart(cart);
}