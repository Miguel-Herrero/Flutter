import 'package:flutter/material.dart';

import 'package:flight_list/ui/custom_shape_clipper.dart';
import 'package:flight_list/theme.dart';
import 'package:flight_list/home/home_bottom.dart';

const List<String> locations = <String>[
  'Boston (BOS)',
  'New York City (JFK)',
  'Paris'
];

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const <Widget>[HomeTop(), HomeBottom()],
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
  int selectedLocationIndex = 0;
  bool isFlightSelected = true;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ClipPath(
        clipper: CustomShapeClipper(),
        child: Container(
          decoration: const BoxDecoration(
              gradient:
                  LinearGradient(colors: <Color>[firstColor, secondColor])),
          height: 400.0,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 50.0,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    const Icon(Icons.location_on, color: Colors.white),
                    const SizedBox(
                      width: 16.0,
                    ),
                    PopupMenuButton<int>(
                      onSelected: (int index) {
                        setState(() {
                          selectedLocationIndex = index;
                        });
                      },
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuItem<int>>[
                            PopupMenuItem<int>(
                              child: Text(locations[0],
                                  style: dropDownMenuItemStyle),
                              value: 0,
                            ),
                            PopupMenuItem<int>(
                              child: Text(locations[1],
                                  style: dropDownMenuItemStyle),
                              value: 1,
                            ),
                            PopupMenuItem<int>(
                              child: Text(locations[2],
                                  style: dropDownMenuItemStyle),
                              value: 2,
                            ),
                          ],
                      child: Row(
                        children: <Widget>[
                          Text(locations[selectedLocationIndex],
                              style: dropDownLabelStyle),
                          const Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    const Icon(Icons.settings, color: Colors.white)
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text('Where would\nyou like to go?',
                  style: TextStyle(
                      fontSize: 24.0, color: Colors.white, height: 0.7),
                  textAlign: TextAlign.center),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                    child: TextField(
                      controller: TextEditingController(text: locations[0]),
                      style: dropDownMenuItemStyle,
                      cursorColor: appTheme.primaryColor,
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 13.0),
                          suffixIcon: Material(
                            elevation: 2.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            child: Icon(Icons.search, color: Colors.black),
                          )),
                    ),
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFlightSelected = true;
                      });
                    },
                    child: MyChoiceChip(
                        icon: Icons.flight,
                        text: 'Flights',
                        isSelected: isFlightSelected),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isFlightSelected = false;
                      });
                    },
                    child: MyChoiceChip(
                        icon: Icons.hotel,
                        text: 'Hotels',
                        isSelected: !isFlightSelected),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ]);
  }
}

class MyChoiceChip extends StatefulWidget {
  const MyChoiceChip({this.icon, this.text, this.isSelected});
  final IconData icon;
  final String text;
  final bool isSelected;

  @override
  State<StatefulWidget> createState() => _MyChoiceChipState();
}

class _MyChoiceChipState extends State<MyChoiceChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
      decoration: widget.isSelected
          ? BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: const BorderRadius.all(Radius.circular(20.0)))
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(widget.icon, color: Colors.white, size: 20.0),
          const SizedBox(width: 8.0),
          Text(widget.text,
              style: const TextStyle(color: Colors.white, fontSize: 14.0))
        ],
      ),
    );
  }
}
