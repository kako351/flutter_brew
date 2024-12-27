
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';

class BeverageDetailArgs {
  final String image;
  final String title;
  final String imageHeroTag;
  final String titleHeroTag;
  final BeverageType type;

  BeverageDetailArgs({required this.image, required this.title, required this.imageHeroTag, required this.titleHeroTag, required this.type});

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