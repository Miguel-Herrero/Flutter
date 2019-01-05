import 'package:flutter/material.dart';

import 'package:flight_list/theme.dart';

class CityFromSelector extends StatelessWidget {
  const CityFromSelector(
      {Key key,
      @required this.items,
      this.selectedItemIndex = 0,
      this.onSelected})
      : assert(items != null),
        super(key: key);

  final Function onSelected;
  final int selectedItemIndex;
  final List<String> items;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      onSelected: onSelected,
      itemBuilder: (BuildContext context) {
        int index = 0;
        return items.map<PopupMenuItem<int>>((String item) {
          return PopupMenuItem<int>(
              child: Text(item, style: dropDownMenuItemStyle), value: index++);
        }).toList();
      },
      child: Row(
        children: <Widget>[
          Text(items[selectedItemIndex], style: dropDownLabelStyle),
          const Icon(
            Icons.keyboard_arrow_down,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
