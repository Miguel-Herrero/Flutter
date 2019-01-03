import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:flight_list/main.dart';
import 'package:flight_list/home/home_screen.dart';

void main() {
  testWidgets('Renders', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(HomeScreen), findsOneWidget);
  });
}
