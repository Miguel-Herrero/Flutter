import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flight_list/home/home_flight_search.dart';

void main() {
  group('FlightSearch', () {
    test('locations are required', () {
      // ignore: missing_required_param, prefer_const_constructors
      expect(() => FlightSearch(), throwsAssertionError);
    });
  });
}