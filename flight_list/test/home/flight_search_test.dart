import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flight_list/home/flight_search.dart';
import 'package:flight_list/home/city_from_selector.dart';
import 'package:flight_list/home/search_type_selector.dart';

void main() {
  group('FlightSearch', () {
    test('parameter "locations" is required', () {
      // ignore: missing_required_param, prefer_const_constructors
      expect(() => FlightSearch(), throwsAssertionError);
    });

    testWidgets('select origin city from popupmenu',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: FlightSearch(
            locations: <String>['Madrid', 'London'],
          ),
        ),
      ));

      final Finder cityFromSelector =
          find.byWidgetPredicate((Widget widget) => widget is CityFromSelector);

      expect(find.widgetWithText(CityFromSelector, 'Madrid'), findsOneWidget);

      // Open PopupMenu to select origin city
      await tester.tap(cityFromSelector);
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      // Select London option from menu
      await tester.tap(find.text('London'));
      await tester.pump();
      await tester.pump(const Duration(seconds: 1));

      expect(find.widgetWithText(CityFromSelector, 'London'), findsOneWidget);
    });

    testWidgets('toggle search type', (WidgetTester tester) async {
      const String flightsSearchType = 'Flights';
      const String hotelsSearchType = 'Hotels';

      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: FlightSearch(
            locations: <String>['Item1', 'Item2'],
          ),
        ),
      ));

      // By default, "Flights" option should be selected
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is SearchTypeSelector &&
              widget.text == flightsSearchType &&
              widget.isSelected == true),
          findsOneWidget);
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is SearchTypeSelector &&
              widget.text == hotelsSearchType &&
              widget.isSelected == false),
          findsOneWidget);

      // Tap on "Flights" search type
      await tester
          .tap(find.widgetWithText(SearchTypeSelector, flightsSearchType));
      await tester.pump();

      // Same "Flights" option should remain selected
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is SearchTypeSelector &&
              widget.text == flightsSearchType &&
              widget.isSelected == true),
          findsOneWidget);
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is SearchTypeSelector &&
              widget.text == hotelsSearchType &&
              widget.isSelected == false),
          findsOneWidget);

      // Tap on "Hotels" search type
      await tester
          .tap(find.widgetWithText(SearchTypeSelector, hotelsSearchType));
      await tester.pump();
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is SearchTypeSelector &&
              widget.text == flightsSearchType &&
              widget.isSelected == false),
          findsOneWidget);
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is SearchTypeSelector &&
              widget.text == hotelsSearchType &&
              widget.isSelected == true),
          findsOneWidget);
    });
  });
}
