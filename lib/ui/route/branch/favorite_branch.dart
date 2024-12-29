part of '../routes.dart';

abstract class FavoriteRoute {
  static const path = '/favorite';
  static const name = 'favorite';
  static const label = 'favorite';
  static const icon = Icon(Icons.favorite);
}

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
    return const FavoritePage();
  }
}

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Favorite!!'),
    );
  }
}
