part of '../routes.dart';

abstract class HomeRoute {
  static const path = '/';
  static const name = 'beverage_list';
  static const label = 'home';
  static const icon = Icon(Icons.home);
}

abstract class DetailRoute {
  static const path = '/beverage/:id';
  static const name = 'beverage_detail';
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
        TypedGoRoute<BeverageDetailPageRoute>(
          path: DetailRoute.path,
          name: DetailRoute.name,
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

class BeverageDetailPageRoute extends GoRouteData {
  const BeverageDetailPageRoute({required this.id, required this.$extra});

  final int id;
  final BeverageDetailArgs $extra;

  static final GlobalKey<NavigatorState> $parentNavigatorKey = _rootNavigatorKey;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    try {
      final extra = state.extra;
      if (extra is! BeverageDetailArgs) {
        return const ErrorPage();
      }
      return BeverageDetailPage(id: id, args: extra);
    } catch (e) {
      return const ErrorPage();
    }
  }
}

