part of '../routes.dart';

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
          path: SearchResultRoute.path,
          name: SearchResultRoute.name,
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
