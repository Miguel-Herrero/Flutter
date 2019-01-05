import 'package:flutter/material.dart';

import 'package:flight_list/ui/custom_shape_clipper.dart';
import 'package:flight_list/home/search_type_selector.dart';
import 'package:flight_list/theme.dart';
import 'package:flight_list/home/city_from_selector.dart';

const Color beginGradientColor = Color(0xFFF47D15);
const Color endGradientColor = Color(0xFFEF772C);

class FlightSearch extends StatefulWidget {
  const FlightSearch({Key key, @required this.locations})
      : assert(locations != null),
        super(key: key);

  final List<String> locations;

  @override
  _FlightSearchState createState() => _FlightSearchState();
}

class _FlightSearchState extends State<FlightSearch> {
  bool isFlightSelected = true;
  int selectedLocationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: CustomShapeClipper(),
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: <Color>[beginGradientColor, endGradientColor],
            )),
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
                      CityFromSelector(
                        selectedItemIndex: selectedLocationIndex,
                        items: widget.locations,
                        onSelected: (int value) {
                          setState(() {
                            selectedLocationIndex = value;
                          });
                        },
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
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30.0)),
                      child: TextField(
                        controller:
                            TextEditingController(text: widget.locations[0]),
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
                      child: SearchTypeSelector(
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
                      child: SearchTypeSelector(
                          icon: Icons.hotel,
                          text: 'Hotels',
                          isSelected: !isFlightSelected),
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
