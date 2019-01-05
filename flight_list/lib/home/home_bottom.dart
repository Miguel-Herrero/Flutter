import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flight_list/theme.dart';

class HomeBottom extends StatelessWidget {
  const HomeBottom({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('Currently Watched Items',
                  style: dropDownMenuItemStyle),
              const Spacer(),
              Text('VIEW ALL (12)', style: viewAllStyle)
            ],
          ),
        ),
        Container(
          height: 240.0,
          child:
              ListView(scrollDirection: Axis.horizontal, children: cityCards),
        )
      ],
    );
  }
}

List<CityCard> cityCards = <CityCard>[
  const CityCard(
    cityName: 'Las Vegas',
    imagePath: 'assets/images/lasvegas.jpg',
    monthYear: 'Feb 2019',
    discount: '45',
    oldPrice: 4299,
    newPrice: 2250,
  ),
  const CityCard(
    cityName: 'Athens',
    imagePath: 'assets/images/athens.jpg',
    monthYear: 'Feb 2019',
    discount: '50',
    oldPrice: 5099,
    newPrice: 2550,
  ),
  const CityCard(
    cityName: 'Sydney',
    imagePath: 'assets/images/sydney.jpg',
    monthYear: 'Feb 2019',
    discount: '40',
    oldPrice: 5999,
    newPrice: 2399,
  )
];

final NumberFormat formatCurrency = NumberFormat.simpleCurrency();

class CityCard extends StatelessWidget {
  const CityCard(
      {Key key,
      this.imagePath,
      this.cityName,
      this.monthYear,
      this.discount,
      this.oldPrice,
      this.newPrice})
      : super(key: key);

  final String imagePath, cityName, monthYear, discount;
  final int oldPrice, newPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 210.0,
                  width: 160.0,
                  child: Image.asset(imagePath, fit: BoxFit.cover),
                ),
                Positioned(
                  left: 0.0,
                  bottom: 0.0,
                  width: 160.0,
                  height: 60.0,
                  child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: <Color>[Colors.black, Colors.black12],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter)),
                  ),
                ),
                Positioned(
                  left: 10.0,
                  bottom: 10.0,
                  right: 10.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(cityName,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 18.0)),
                          Text(monthYear,
                              style: const TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: 14.0))
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        decoration: const BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Text('$discount%',
                            style: const TextStyle(
                                fontSize: 14.0, color: Colors.black)),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                width: 5.0,
              ),
              Text('${formatCurrency.format(newPrice)}',
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0)),
              const SizedBox(
                width: 5.0,
              ),
              Text('(${formatCurrency.format(oldPrice)})',
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 12.0)),
            ],
          )
        ],
      ),
    );
  }
}
