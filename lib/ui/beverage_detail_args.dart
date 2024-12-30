
import 'package:flutter_brew/data/model/beverage.dart';
import 'package:flutter_brew/data/model/beverage_type.dart';
import 'package:flutter_brew/ui/viewdata/beverage_view_data.dart';

class BeverageDetailArgs {
  final String image;
  final String title;
  final String imageHeroTag;
  final String titleHeroTag;
  final BeverageType type;

  BeverageDetailArgs({required this.image, required this.title, required this.type, this.imageHeroTag = '', this.titleHeroTag = ''});

  static BeverageDetailArgs fromModel(Beverage beverage) {
    return BeverageDetailArgs(
      image: beverage.image,
      title: beverage.title,
      imageHeroTag: beverage.imageHeroTag,
      titleHeroTag: beverage.titleHeroTag,
      type: beverage.type,
    );
  }

  static BeverageDetailArgs fromViewData(BeverageViewData viewData) {
    return BeverageDetailArgs(
      image: viewData.image,
      title: viewData.title,
      imageHeroTag: viewData.heroTag.imageHeroTag,
      titleHeroTag: viewData.heroTag.titleHeroTag,
      type: viewData.type,
    );
  }
}