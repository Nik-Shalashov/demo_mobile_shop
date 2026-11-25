import 'dart:math' as math;

class PriceRange {
  final double? min;
  final double? max;

  const PriceRange({this.min, this.max});

  bool get isEmpty => min == null && max == null;

  bool matches(double price) {
    final lo = min;
    final hi = max;

    if (lo != null && hi != null) {
      return price >= math.min(lo, hi) && price <= math.max(lo, hi);
    }
    if (lo != null) return price >= lo;
    if (hi != null) return price <= hi;
    return true;
  }

  PriceRange copyWith({
    double? min,
    double? max,
    bool clearMin = false,
    bool clearMax = false,
  }) {
    return PriceRange(
      min: clearMin ? null : (min ?? this.min),
      max: clearMax ? null : (max ?? this.max),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PriceRange &&
          runtimeType == other.runtimeType &&
          min == other.min &&
          max == other.max;

  @override
  int get hashCode => Object.hash(min, max);
}
