import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flight_list/home/search_type_selector.dart';

void main() {
  group('SearchTypeSelector', () {
    testWidgets('Renders', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: SearchTypeSelector(
              icon: Icons.hotel, text: 'Hotels', isSelected: false),
        ),
      ));

      // Search the whole widget by the text that contains
      expect(find.widgetWithText(SearchTypeSelector, 'Hotels'), findsOneWidget);

      // Assert the widget has these properties
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is SearchTypeSelector &&
              widget.icon == Icons.hotel &&
              widget.isSelected == false),
          findsOneWidget);
    });

    testWidgets('has BoxDecoration when selected', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: SearchTypeSelector(
              icon: Icons.hotel, text: 'Hotels', isSelected: true),
        ),
      ));

      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is Container &&
              widget.decoration ==
                  BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)))),
          findsOneWidget);
    });

    testWidgets('has not BoxDecoration when not selected', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: SearchTypeSelector(
              icon: Icons.hotel, text: 'Hotels', isSelected: false),
        ),
      ));

      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is Container &&
              widget.decoration == null),
          findsOneWidget);
    });
  });
}
