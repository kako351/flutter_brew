
import 'package:flutter_brew/data/model/beverage.dart';

abstract interface class BeveragesViewState {}

class ErrorBeveragesViewState implements BeveragesViewState {}

class SuccessBeveragesViewState implements BeveragesViewState {
  final List<Beverage> beverages;

  SuccessBeveragesViewState(this.beverages);
}
