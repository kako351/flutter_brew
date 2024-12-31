
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/ui/herotag/hero_tag_builder.dart';

class BeverageDetailArgs {
  final String image;
  final String title;
  final BeverageType type;
  final HeroTag imageHeroTag;
  final HeroTag titleHeroTag;

  BeverageDetailArgs({required this.image, required this.title, required this.type, required this.imageHeroTag, required this.titleHeroTag});

  static BeverageDetailArgs fromModel(Beverage beverage) {
    return BeverageDetailArgs(
      image: beverage.image,
      title: beverage.title,
      imageHeroTag: beverage.imageHeroTag,
      titleHeroTag: beverage.titleHeroTag,
      type: beverage.type,
    );
  }
}