import 'dart:ffi';

import 'package:flutter_brew/ui/beverage_detail.dart';
import 'package:flutter_brew/ui/beverage_list.dart';
import 'package:go_router/go_router.dart';

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'beverage_list',
      builder: (context, state) => BeverageListPage(),
    ),
    GoRoute(
      path: '/beverage/:id',
      name: 'beverage_detail',
      builder: (context, state) => BeverageDetailPage(id: int.parse(state.pathParameters['id'] as String)),
    )
  ],
);