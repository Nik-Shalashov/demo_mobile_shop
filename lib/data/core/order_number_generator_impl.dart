import 'dart:math';

import 'package:demo_mobile_shop/domain/services/order_number_generator.dart';

class OrderNumberGeneratorImpl implements OrderNumberGenerator {
  static const int _minSuffix = 10000;
  static const int _maxSuffixExclusive = 100000;

  final Random _random;

  OrderNumberGeneratorImpl({Random? random}) : _random = random ?? Random();

  @override
  String generate() {
    final now = DateTime.now();
    final day = now.day.toString().padLeft(2, '0');
    final month = now.month.toString().padLeft(2, '0');
    final suffix = _minSuffix + _random.nextInt(_maxSuffixExclusive - _minSuffix);
    return '$day$month-$suffix';
  }
}