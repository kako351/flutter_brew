import 'package:flutter_brew/ui/beverage_list.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => BeverageListPage(),
    ),
  ],
);