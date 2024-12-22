
import 'package:flutter_brew/data/model/beverage.dart';

class BeverageDetailArgs {
  final String image;
  final String title;
  final String imageHeroTag;
  final String titleHeroTag;

  BeverageDetailArgs({required this.image, required this.title, required this.imageHeroTag, required this.titleHeroTag});

  static BeverageDetailArgs fromModel(Beverage beverage) {
    return BeverageDetailArgs(
      image: beverage.image,
      title: beverage.title,
      imageHeroTag: beverage.imageHeroTag,
      titleHeroTag: beverage.titleHeroTag
    );
  }
}