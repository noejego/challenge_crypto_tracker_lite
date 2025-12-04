String simplifyFormatNumber(double value) {
  if (value >= 1e9) {
    return '\$${(value / 1e9).toStringAsFixed(2)}B';
  } else if (value >= 1e6) {
    return '\$${(value / 1e6).toStringAsFixed(2)}M';
  } else {
    return value.toStringAsFixed(2);
  }
}
