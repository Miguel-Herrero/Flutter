import 'package:flutter/material.dart';

import 'package:flight_list/home/home_flight_search.dart';

const List<String> locations = <String>[
  'Boston (BOS)',
  'New York City (JFK)',
  'Paris (CDG)'
];

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            const FlightSearch(locations: locations),
            Container(
              child: Text('Adios'),
              color: Colors.black12,
              height: 1400.0,
            )
          ],
        ),
      ),
    );
  }
}
