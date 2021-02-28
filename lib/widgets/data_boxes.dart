import 'package:flutter/material.dart';
import 'package:covid_corner/config/palette.dart';

class DataBoxes extends StatelessWidget {
  final List<int> boxData;

  const DataBoxes({@required this.boxData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: <Widget>[
          Flexible(
            child: Row(
              children: <Widget>[
                _createBox(
                    'New Cases', boxData[0].toString(), Palette.lightYellow),
                _createBox(
                    'Active Cases', boxData[1].toString(), Colors.lightBlue)
              ],
            ),
          ),
          Flexible(
            child: Row(
              children: <Widget>[
                _createBox('Recovered', boxData[2].toString(), Colors.green),
                _createBox(
                    'Total Deaths', boxData[3].toString(), Palette.lightRed)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Expanded _createBox(String name, String number, Color colour) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
