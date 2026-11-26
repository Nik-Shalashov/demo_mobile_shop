import 'package:demo_mobile_shop/di/modules/cart_module.dart';
import 'package:demo_mobile_shop/di/modules/catalog_module.dart';
import 'package:demo_mobile_shop/di/modules/checkout_module.dart';
import 'package:demo_mobile_shop/di/modules/core_module.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';

final getIt = GetIt.instance;

Future<void> configureDependencies({
  required Box<String> catalogBox,
  required Box<String> cartBox,
}) async {
  registerCoreModule(getIt);
  registerCatalogModule(getIt, catalogBox);
  registerCartModule(getIt, cartBox);
  registerCheckoutModule(getIt);
}