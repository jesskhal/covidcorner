import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:covid_corner/config/styles.dart';
import 'package:covid_corner/data/data.dart';
import 'package:covid_corner/config/palette.dart';

class RegionBarChart extends StatelessWidget {
  final List<double> covidCases;

  const RegionBarChart({@required this.covidCases});

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    return Container(
      height: 350.0,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20.0),
            alignment: Alignment.centerLeft,
            child: Text(
              'Daily New Cases (past week)',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.85,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 16.0,
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: SideTitles(
                    margin: 10.0,
                    showTitles: true,
                    textStyle: Styles.chartLabelsTextStyle,
                    rotateAngle: 35.0,
                    getTitles: (double value) {
                      var _dates = [
                        DateTime(now.year, now.month, now.day - 7),
                        DateTime(now.year, now.month, now.day - 6),
                        DateTime(now.year, now.month, now.day - 5),
                        DateTime(now.year, now.month, now.day - 4),
                        DateTime(now.year, now.month, now.day - 3),
                        DateTime(now.year, now.month, now.day - 2),
                        DateTime(now.year, now.month, now.day - 1)
                      ];
                      var _days = [
                        months[_dates[0].month] +
                            ' ' +
                            (_dates[0].day.toString()),
                        months[_dates[1].month] +
                            ' ' +
                            (_dates[1].day.toString()),
                        months[_dates[2].month] +
                            ' ' +
                            (_dates[2].day.toString()),
                        months[_dates[3].month] +
                            ' ' +
                            (_dates[3].day.toString()),
                        months[_dates[4].month] +
                            ' ' +
                            (_dates[4].day.toString()),
                        months[_dates[5].month] +
                            ' ' +
                            (_dates[5].day.toString()),
                        months[_dates[6].month] +
                            ' ' +
                            (_dates[6].day.toString()),
                      ];
                      switch (value.toInt()) {
                        case 0:
                          return _days[0];
                        case 1:
                          return _days[1];
                        case 2:
                          return _days[2];
                        case 3:
                          return _days[3];
                        case 4:
                          return _days[4];
                        case 5:
                          return _days[5];
                        case 6:
                          return _days[6];
                        default:
                          return '';
                      }
                    },
                  ),
                  leftTitles: SideTitles(
                      margin: 10.0,
                      showTitles: true,
                      textStyle: Styles.chartLabelsTextStyle,
                      getTitles: (value) {
                        if (value == 0) {
                          return '0';
                        } else if (value % 3 == 0) {
                          return '${value ~/ 3 * 70}';
                        }
                        return '';
                      }),
                ),
                gridData: FlGridData(
                  show: true,
                  checkToShowHorizontalLine: (value) => value % 3 == 0,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.black12,
                    strokeWidth: 1.0,
                    dashArray: [5],
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: covidCases
                    .asMap()
                    .map((key, value) => MapEntry(
                        key,
                        BarChartGroupData(
                          x: key,
                          barRods: [
                            BarChartRodData(
                              y: value,
                              color: Palette.lightRed,
                            ),
                          ],
                        )))
                    .values
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
