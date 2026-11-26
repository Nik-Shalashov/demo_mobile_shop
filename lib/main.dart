import 'package:demo_mobile_shop/di/injection.dart';
import 'package:hive_ce/hive.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:material_ui/material_ui.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  final catalogBox = await Hive.openBox<String>('catalog_cache');
  final cartBox = await Hive.openBox<String>('cart_cache');

  await configureDependencies(
    catalogBox: catalogBox,
    cartBox: cartBox,
  );

  runApp(const App());
}
