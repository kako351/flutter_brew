import 'package:flutter_brew/data/model/beverage.dart';

extension BeverageDisplay on Beverage {
  /// 材料をブレット記号で区切って表示用にフォーマット
  String get formattedIngredients => ingredients.join('、 ');

  /// 長い説明文を100文字で省略して表示
  String get shortDescription => description.length > 100 
      ? '${description.substring(0, 100)}...' 
      : description;
}