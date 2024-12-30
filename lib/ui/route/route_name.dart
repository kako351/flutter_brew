import 'package:flutter/material.dart';

abstract interface class RouteName {
  String getRouteName();
}

abstract class DetailRoute implements RouteName {
  static const String path = '/beverage/:id';
  static const String name = 'beverage_detail';

  @override
  String getRouteName() => name;
}

abstract class HomeRoute implements RouteName {
  static const path = '/';
  static const name = 'beverage_list';
  static const label = 'home';
  static const icon = Icon(Icons.home);

  @override
  String getRouteName() => name;
}

abstract class SearchResultRoute implements RouteName {
  static const path = '/search';
  static const name = 'search';

  @override
  String getRouteName() => name;
}

abstract class FavoriteRoute implements RouteName {
  static const path = '/favorite';
  static const name = 'favorite';
  static const label = 'favorite';
  static const icon = Icon(Icons.favorite);

  @override
  String getRouteName() => name;
}
