import 'package:flutter/material.dart';

import 'package:flight_list/widgets/custom_shape_clipper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Flight list',
        debugShowCheckedModeBanner: false,
        home: HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[HomeTop()],
      ),
    );
  }
}

class HomeTop extends StatefulWidget {
  const HomeTop();
  @override
  State<StatefulWidget> createState() => _HomeTopState();
}

class _HomeTopState extends State<HomeTop> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          height: 400.0,
          color: Colors.orange,
        ),
      ),
    ]);
  }
}
