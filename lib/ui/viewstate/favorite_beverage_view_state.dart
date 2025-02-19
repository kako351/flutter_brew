
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/ui/herotag/hero_tag_builder.dart';

abstract interface class FavoriteBeverageViewState {}

class ErrorFavoriteBeverageViewState implements FavoriteBeverageViewState {}

class SuccessFavoriteBeverageViewState implements FavoriteBeverageViewState {
  final List<Beverage> beverages;

  SuccessFavoriteBeverageViewState(this.beverages);

  HeroTag get imageHeroTag => HeroTagBuilder().build();
  HeroTag get titleHeroTag => HeroTagBuilder().build();
}
