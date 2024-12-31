
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/ui/herotag/hero_tag_builder.dart';

abstract interface class SearchResultViewState {}

class ErrorSearchResultViewState implements SearchResultViewState {}

class SuccessSearchResultViewState implements SearchResultViewState {
  final List<Beverage> beverages;

  SuccessSearchResultViewState(this.beverages);

  HeroTag get imageHeroTag => HeroTagBuilder().build();
  HeroTag get titleHeroTag => HeroTagBuilder().build();
}
