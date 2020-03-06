/// Contains some useful methods for doubles.
extension DoubleUtils on double {
  /// Does a linear interpolation of two doubles, this one and another.
  double lerp(double other, double t) {
    other ??= 0.0;
    return this + (other - this) * t;
  }
}