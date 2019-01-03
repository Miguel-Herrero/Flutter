import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:flight_list/main.dart';
import 'package:flight_list/main.dart' as my_app;
import 'package:flight_list/home/home_screen.dart';

void main() {
  testWidgets('Renders (Widget testing)', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(HomeScreen), findsOneWidget);
  });

  testWidgets('Renders (Unit testing)', (WidgetTester tester) async {
    my_app.main(); // builds the app and schedules a frame but doesn't trigger one
    await tester.pump(); // triggers a frame

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
