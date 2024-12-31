import 'package:flutter/material.dart';

abstract class RouteName {
  const RouteName();
  String getRouteName();
}

final class DetailRoute extends RouteName {
  static const String path = '/beverage/:id';
  static const String name = 'beverage_detail';

  @override
  String getRouteName() => name;
}

final class HomeRoute extends RouteName {
  static const path = '/';
  static const name = 'beverage_list';
  static const label = 'home';
  static const icon = Icon(Icons.home);

  @override
  String getRouteName() => name;
}

final class SearchResultRoute extends RouteName {
  static const path = '/search';
  static const name = 'search';

  @override
  String getRouteName() => name;
}

final class FavoriteRoute extends RouteName {
  static const path = '/favorite';
  static const name = 'favorite';
  static const label = 'favorite';
  static const icon = Icon(Icons.favorite);

  @override
  String getRouteName() => name;
}
