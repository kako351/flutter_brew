
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/data/model/search_history.dart';

abstract interface class BeveragesViewState {}

class ErrorBeveragesViewState implements BeveragesViewState {}

class SuccessBeveragesViewState implements BeveragesViewState {
  final List<Beverage> beverages;
  final BeverageType type;
  final List<SearchHistory> searchHistories;

  SuccessBeveragesViewState(this.beverages, this.type, {this.searchHistories = const []});

  List<Beverage> topBeverages () => beverages.take(3).toList();
  List<Beverage> remainingBeverages () => beverages.skip(3).toList();
}
