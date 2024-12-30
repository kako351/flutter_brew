
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_brew/ui/beverage_detail.dart';
import 'package:flutter_brew/ui/beverage_detail_args.dart';
import 'package:flutter_brew/ui/beverage_list.dart';
import 'package:flutter_brew/ui/error_page.dart';
import 'package:flutter_brew/ui/favorite_beverage.dart';
import 'package:flutter_brew/ui/search_result.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

part 'routes.g.dart';
part 'branch/home_branch.dart';
part 'branch/favorite_branch.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: HomeRoute.path, // 初期ルート
    navigatorKey: _rootNavigatorKey, // ルートナビゲーターキー
    debugLogDiagnostics: kDebugMode, // デバッグモードでのみログを出力
    routes: $appRoutes,// 生成されたルート
  );
});

@TypedStatefulShellRoute<MainShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    homeStatefulShellBranch,
    favoriteStatefulShellBranch,
  ],
)

class MainShellRouteData extends StatefulShellRouteData {
  const MainShellRouteData();

  @override
  Widget builder(
      BuildContext context,
      GoRouterState state,
      StatefulNavigationShell navigationShell,
      ) {
    return AppNavigationBar(navigationShell: navigationShell);
  }
}

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        destinations: const [
          NavigationDestination(
            icon: HomeRoute.icon,
            label: HomeRoute.label,
          ),
          NavigationDestination(
            icon: FavoriteRoute.icon,
            label: FavoriteRoute.label,
          ),
        ],
        onDestinationSelected: _goBranch,
      ),
    );
  }

  // タブ選択時の処理
  void _goBranch(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}

abstract class DetailRoute {
  static const path = '/beverage/:id';
  static const name = 'beverage_detail';
}

@TypedGoRoute<BeverageDetailPageRoute>(
  path: DetailRoute.path,
)
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
