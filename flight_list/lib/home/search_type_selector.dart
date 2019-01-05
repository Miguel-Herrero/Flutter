import 'package:flutter/material.dart';

class SearchTypeSelector extends StatefulWidget {
  const SearchTypeSelector({this.icon, this.text, this.isSelected});
  final IconData icon;
  final String text;
  final bool isSelected;

  @override
  State<StatefulWidget> createState() => _SearchTypeSelectorState();
}

class _SearchTypeSelectorState extends State<SearchTypeSelector> {
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
