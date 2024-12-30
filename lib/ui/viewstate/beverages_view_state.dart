
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/ui/herotag/hero_tag_builder.dart';
import 'package:flutter_brew/ui/route/route_name.dart';
import 'package:flutter_brew/ui/viewdata/beverage_view_data.dart';

abstract interface class BeveragesViewState {}

class ErrorBeveragesViewState implements BeveragesViewState {}

class SuccessBeveragesViewState implements BeveragesViewState {
  final List<BeverageViewData> beveragesViewData;
  final BeverageType type;

  SuccessBeveragesViewState(this.beveragesViewData, this.type);

  List<BeverageViewData> topBeverages () => beveragesViewData.take(3).toList();
  List<BeverageViewData> remainingBeverages () => beveragesViewData.skip(3).toList();

  HeroTag getHeroTag(Beverage beverage) {
    return HeroTagBuilder(beverage, HomeRoute()).build();
  }
}
