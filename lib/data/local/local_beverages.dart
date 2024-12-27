
import 'package:flutter_brew/data/model/beverage.dart';

class LocalBeverages {
  LocalBeverages(this.beverages);

  List<Beverage> beverages = [];

  void saveBeverages(List<Beverage> beverages) {
    this.beverages = beverages;
  }
}
