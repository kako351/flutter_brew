import 'package:flutter_brew/ui/beverage_detail.dart';
import 'package:flutter_brew/ui/beverage_detail_args.dart';
import 'package:flutter_brew/ui/beverage_list.dart';
import 'package:flutter_brew/ui/error_page.dart';
import 'package:go_router/go_router.dart';

abstract class HomeRoute {
  static const path = '/';
  static const name = 'beverage_list';
}

abstract class DetailRoute {
  static const path = '/beverage/:id';
  static const name = 'beverage_detail';
}

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: HomeRoute.path,
      name: HomeRoute.name,
      builder: (context, state) => BeverageListPage(),
    ),
    GoRoute(
      path: DetailRoute.path,
      name: DetailRoute.name,
      builder: (context, state) {
        final idStr = state.pathParameters['id'];
        final args = state.extra as BeverageDetailArgs;
        try {
          final id = int.parse(idStr ?? '');
          return BeverageDetailPage(id: id, args: args);
        } catch (e) {
          return const ErrorPage();
        }
      }
    )
  ],
);