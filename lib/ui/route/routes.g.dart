// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'routes.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $mainShellRouteData,
    ];

RouteBase get $mainShellRouteData => StatefulShellRouteData.$route(
      factory: $MainShellRouteDataExtension._fromState,
      branches: [
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/',
              name: 'beverage_list',
              factory: $HomePageRouteExtension._fromState,
              routes: [
                GoRouteData.$route(
                  path: '/beverage/:id',
                  name: 'beverage_detail',
                  parentNavigatorKey:
                      BeverageDetailPageRoute.$parentNavigatorKey,
                  factory: $BeverageDetailPageRouteExtension._fromState,
                ),
                GoRouteData.$route(
                  path: '/search',
                  name: 'search',
                  factory: $SearchResultPageRouteExtension._fromState,
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranchData.$branch(
          routes: [
            GoRouteData.$route(
              path: '/favorite',
              name: 'favorite',
              factory: $FavoritePageRouteExtension._fromState,
            ),
          ],
        ),
      ],
    );

extension $MainShellRouteDataExtension on MainShellRouteData {
  static MainShellRouteData _fromState(GoRouterState state) =>
      const MainShellRouteData();
}

extension $HomePageRouteExtension on HomePageRoute {
  static HomePageRoute _fromState(GoRouterState state) => const HomePageRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BeverageDetailPageRouteExtension on BeverageDetailPageRoute {
  static BeverageDetailPageRoute _fromState(GoRouterState state) =>
      BeverageDetailPageRoute(
        id: int.parse(state.pathParameters['id']!),
        $extra: state.extra as BeverageDetailArgs,
      );

  String get location => GoRouteData.$location(
        '/beverage/${Uri.encodeComponent(id.toString())}',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

extension $SearchResultPageRouteExtension on SearchResultPageRoute {
  static SearchResultPageRoute _fromState(GoRouterState state) =>
      SearchResultPageRoute(
        words: state.uri.queryParameters['words'],
      );

  String get location => GoRouteData.$location(
        '/search',
        queryParams: {
          if (words != null) 'words': words,
        },
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $FavoritePageRouteExtension on FavoritePageRoute {
  static FavoritePageRoute _fromState(GoRouterState state) =>
      const FavoritePageRoute();

  String get location => GoRouteData.$location(
        '/favorite',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
