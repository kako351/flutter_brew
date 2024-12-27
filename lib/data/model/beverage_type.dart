
enum BeverageType implements Comparable<BeverageType> {
  hot(rawValue: 'hot', displayValue: 'Hot'),
  iced(rawValue: 'iced', displayValue: 'Iced'),
  all(rawValue: 'all', displayValue: 'All');

  const BeverageType({required this.rawValue, required this.displayValue});
  final String rawValue;
  final String displayValue;

  // default value
  static const BeverageType defaultValue = all;

  factory BeverageType.fromRawValue(String rawValue) {
    switch (rawValue) {
      case 'hot':
        return BeverageType.hot;
      case 'iced':
        return BeverageType.iced;
      case 'all':
        return BeverageType.all;
      default:
        throw Exception('Unknown raw value: $rawValue');
    }
  }

  @override
  int compareTo(BeverageType other) {
    return rawValue.compareTo(other.rawValue);
  }
}
