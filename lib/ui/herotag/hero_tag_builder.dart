import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/ui/route/route_name.dart';

class HeroTag {
  String imageHeroTag;
  String titleHeroTag;

  HeroTag(this.imageHeroTag, this.titleHeroTag);
}

class HeroTagBuilder {
  HeroTagBuilder(Beverage beverage, RouteName routeName)
    : _beverage = beverage,
      _imageHeroTag = 'beverage_image_${beverage.beverageId}_${beverage.title}_from_${routeName.getRouteName()}',
      _titleHeroTag = 'beverage_title_${beverage.beverageId}_${beverage.title}_from_${routeName.getRouteName()}';

  final Beverage _beverage;
  String _imageHeroTag;
  String _titleHeroTag;

  void setImageHeroTag(RouteName routeName) {
    _imageHeroTag = 'beverage_image_${_beverage.beverageId}_${_beverage.title}_from_${routeName.getRouteName()}';
  }

  void setTitleHeroTag(RouteName routeName) {
    _titleHeroTag = 'beverage_title_${_beverage.beverageId}_${_beverage.title}_from_${routeName.getRouteName()}';
  }

  HeroTag build() {
    return HeroTag(_imageHeroTag, _titleHeroTag);
  }
}
