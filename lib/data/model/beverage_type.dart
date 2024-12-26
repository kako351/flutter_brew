
enum BeverageType implements Comparable<BeverageType> {
  hot(rawValue: 'hot'),
  iced(rawValue: 'iced');

  const BeverageType({required this.rawValue});
  final String rawValue;

  factory BeverageType.fromRawValue(String rawValue) {
    switch (rawValue) {
      case 'hot':
        return BeverageType.hot;
      case 'iced':
        return BeverageType.iced;
      default:
        throw Exception('Unknown raw value: $rawValue');
    }
  }

  @override
  int compareTo(BeverageType other) {
    return rawValue.compareTo(other.rawValue);
  }
}
