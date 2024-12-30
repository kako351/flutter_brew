part of '../routes.dart';

abstract class HomeRoute {
  static const path = '/';
  static const name = 'beverage_list';
  static const label = 'home';
  static const icon = Icon(Icons.home);
}

abstract class SearchResult {
  static const path = '/search';
  static const name = 'search';
}

class HomeShellBranch extends StatefulShellBranchData {
  const HomeShellBranch();
}

const homeStatefulShellBranch = TypedStatefulShellBranch<HomeShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<HomePageRoute>(
      path: HomeRoute.path,
      name: HomeRoute.name,
      routes: [
        TypedGoRoute<SearchResultPageRoute>(
          path: SearchResult.path,
          name: SearchResult.name,
        ),
      ],
    ),
  ],
);

class HomePageRoute extends GoRouteData {
  const HomePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BeverageListPage();
  }
}

class SearchResultPageRoute extends GoRouteData {
  const SearchResultPageRoute({this.words});

  final String? words;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchResultPage(words: words ?? '');
  }
}
