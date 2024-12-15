import 'package:flutter/material.dart';
import 'package:flutter_brew/ui/beverage_list.dart';
import 'package:flutter_brew/ui/beverages_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'mock_beverage_view_model.dart';

void main() {
  final BeveragesViewModel beveragesViewModel = MockBeverageViewModel();

  testWidgets('Beverage list test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final ProviderContainer container = ProviderContainer(
      overrides: [
        beveragesViewModelProvider.overrideWith(() => beveragesViewModel)
      ]
    );

    await tester.pumpWidget(
        UncontrolledProviderScope(
            container: container,
            child: MaterialApp(
              home: BeverageList(),
            )
        )
    );

    await tester.pumpAndSettle();

    expect(find.textContaining('Black Coffee'), findsOneWidget);
  });
}