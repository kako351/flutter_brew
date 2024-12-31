part of '../routes.dart';

class FavoriteShellBranch extends StatefulShellBranchData {
  const FavoriteShellBranch();
}

const favoriteStatefulShellBranch = TypedStatefulShellBranch<FavoriteShellBranch>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<FavoritePageRoute>(
      path: FavoriteRoute.path,
      name: FavoriteRoute.name,
      routes: [
      ],
    ),
  ],
);

class FavoritePageRoute extends GoRouteData {
  const FavoritePageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const FavoriteBeveragePage();
  }
}
