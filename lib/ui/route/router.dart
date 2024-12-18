import 'dart:ffi';

import 'package:flutter_brew/ui/beverage_detail.dart';
import 'package:flutter_brew/ui/beverage_list.dart';
import 'package:flutter_brew/ui/error_page.dart';
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
      builder: (context, state) {
        final idStr = state.pathParameters['id'];
        try {
          final id = int.parse(idStr ?? '');
          return BeverageDetailPage(id: id);
        } catch (e) {
          return const ErrorPage();
        }
      }
    )
  ],
);