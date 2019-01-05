import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:flight_list/home/home_screen.dart';

void main() {
  const MaterialApp app = MaterialApp(home: HomeScreen());
  group('HomeScreen', () {
    testWidgets('Renders', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(app);

      expect(find.text('Boston (BOS)'), findsNWidgets(2));
      expect(find.text('Where would\nyou like to go?'), findsOneWidget);
      expect(find.text('Flights'), findsOneWidget);
      expect(find.text('Hotels'), findsOneWidget);
      expect(find.byWidgetPredicate((Widget widget) => widget is MyChoiceChip),
          findsNWidgets(2));
    });

    testWidgets('Tap on self-button keeps selected state',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(app);

      expect(find.byWidgetPredicate((Widget widget) => widget is MyChoiceChip),
          findsNWidgets(2));
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is MyChoiceChip &&
              widget.isSelected == true &&
              widget.text == 'Flights'),
          findsOneWidget);
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is MyChoiceChip &&
              widget.isSelected == false &&
              widget.text == 'Hotels'),
          findsOneWidget);

      await tester.tap(find.text('Flights'));
      await tester.pump(Duration.zero);

      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is MyChoiceChip &&
              widget.isSelected == true &&
              widget.text == 'Flights'),
          findsOneWidget);
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is MyChoiceChip &&
              widget.isSelected == false &&
              widget.text == 'Hotels'),
          findsOneWidget);
    });

    testWidgets('Tap on button renders selected state',
        (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(app);

      expect(find.byWidgetPredicate((Widget widget) => widget is MyChoiceChip),
          findsNWidgets(2));
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is MyChoiceChip &&
              widget.isSelected == true &&
              widget.text == 'Flights'),
          findsOneWidget);
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is MyChoiceChip &&
              widget.isSelected == false &&
              widget.text == 'Hotels'),
          findsOneWidget);

      await tester.tap(find.text('Hotels'));
      await tester.pump(Duration.zero);

      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is MyChoiceChip &&
              widget.isSelected == false &&
              widget.text == 'Flights'),
          findsOneWidget);
      expect(
          find.byWidgetPredicate((Widget widget) =>
              widget is MyChoiceChip &&
              widget.isSelected == true &&
              widget.text == 'Hotels'),
          findsOneWidget);
    });
  });
}
