class EmptyCartException implements Exception {
  const EmptyCartException();

  @override
  String toString() => 'Корзина пуста — оформление невозможно';
}