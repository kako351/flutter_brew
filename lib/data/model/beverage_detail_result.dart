
import 'package:flutter_brew/data/model/beverage.dart';

sealed class BeverageDetailResult {}

class Success extends BeverageDetailResult {
  final Beverage beverageDetail;

  Success(this.beverageDetail);
}

class Error extends BeverageDetailResult {
  final String message;

  Error(this.message);
}
