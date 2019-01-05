import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flight_list/home/city_from_selector.dart';

void main() {
  group('CityFromSelector', () {
    testWidgets('Renders', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: CityFromSelector(
            items: <String>['Item1'],
          ),
        ),
      ));

      expect(find.widgetWithText(CityFromSelector, 'Item1'), findsOneWidget);
    });

    testWidgets('Renders items options', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: CityFromSelector(
            items: <String>['Item1', 'Item2'],
          ),
        ),
      ));

      await tester.tap(find.text('Item1'));
      await tester.pump();
      await tester
          .pump(const Duration(seconds: 1)); // finish the menu animation

      expect(find.text('Item2'), findsOneWidget);
    });

    test('items are required', () {
      // ignore: missing_required_param, prefer_const_constructors
      expect(() => CityFromSelector(), throwsAssertionError);
    });
  });
}
