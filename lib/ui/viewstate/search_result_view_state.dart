
import 'package:flutter_brew/data/model/beverage.dart';

abstract interface class SearchResultViewState {}

class ErrorSearchResultViewState implements SearchResultViewState {}

class SuccessSearchResultViewState implements SearchResultViewState {
  final List<Beverage> beverages;

  SuccessSearchResultViewState(this.beverages);
}
