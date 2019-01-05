import 'package:flutter/material.dart';

import 'package:flight_list/theme.dart';
import 'package:flight_list/home/home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flight list',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: const HomePage());
  }
}
