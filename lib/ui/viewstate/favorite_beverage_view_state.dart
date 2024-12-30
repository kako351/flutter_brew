
import 'package:flutter_brew/data/model/beverage.dart';

abstract interface class FavoriteBeverageViewState {}

class ErrorFavoriteBeverageViewState implements FavoriteBeverageViewState {}

class SuccessFavoriteBeverageViewState implements FavoriteBeverageViewState {
  final List<Beverage> beverages;

  SuccessFavoriteBeverageViewState(this.beverages);
}
