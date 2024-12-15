import 'package:flutter_brew/data/model/beverage.dart';

sealed class BeverageResult {}

class Success extends BeverageResult {
  final List<Beverage> beverages;

  Success(this.beverages);
}

class Error extends BeverageResult {
  final String message;

  Error(this.message);
}
