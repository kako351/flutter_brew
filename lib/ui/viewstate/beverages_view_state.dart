
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';

abstract interface class BeveragesViewState {}

class ErrorBeveragesViewState implements BeveragesViewState {}

class SuccessBeveragesViewState implements BeveragesViewState {
  final List<Beverage> beverages;
  final BeverageType type;

  SuccessBeveragesViewState(this.beverages, this.type);
}
