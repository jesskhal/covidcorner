import 'package:flutter/material.dart';
import 'package:covid_corner/config/palette.dart';
import 'package:covid_corner/data/data.dart';
import 'package:covid_corner/widgets/widgets.dart';
import 'package:covid_corner/widgets/region_dropdown.dart';
import 'package:covid_corner/widgets/region_bar_chart.dart';
import 'package:covid_corner/widgets/data_boxes.dart';
import 'package:covid_corner/widgets/statistics.dart';
//import 'package:http/http.dart' as http;
//import 'dart:convert' as convert;

var _region = 'Peel Region (Mississauga/Brampton)';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  List<Statistics> statistics = List<Statistics>();

  // MAYBE FOR ANOTHER DAY :(
  // THIS WAS SUPPOSED TO BE THE Google Sheets JSON READER.
  // getStatisticsFromGoogleSheets() async {
  //   var raw = await http.get(
  //       "https://script.googleusercontent.com/macros/echo?user_content_key=za3KbDI1J1upACLVZveBwjNWRNM1iuPVg18InbSdDfdv04FpdhBTJfoOTBwHWemQWpDJKPLwF72g8aa-07QFzYaohliiLO6Ym5_BxDlH2jW0nuo2oDemN9CCS2h10ox_1xSncGQajx_ryfhECjZEnHCtj7XI1Qx94_sxxvtcN4wR7_N7eC2rYMh0NmiCmmljFrNz0X60DXbC0BtJjZ7Q4w&lib=Mo2QYVzK_KhUuZ0wvnBc-U_iyV8eplBii");

  //   var jsonFeedback = convert.jsonDecode(raw.body);
  //   jsonFeedback.forEach((element) {
  //     Statistics stat = new Statistics();
  //     stat.newCases = element['new_cases'];
  //     stat.activeCases = element['feedback'];
  //     stat.recoveredCases = element['recovered_cases'];
  //     stat.deaths = element['deaths'];

  //     statistics.add(stat);
  //   });
  // }

  // @override
  // void initState() {
  //   getStatisticsFromGoogleSheets();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.lightGreen,
      appBar: CustomAppBarStats(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
              child: Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: Palette.lightGreen,
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(Icons.location_pin, color: Palette.lightRed),
                            RegionDropdown(
                              regions: regions,
                              region: _region,
                              onChanged: (val) {
                                setState(
                                  () {
                                    _region = val;
                                  },
                                );
                              },
                            ),
                          ],
                        )
                      ]))),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            sliver: SliverToBoxAdapter(
              child: DataBoxes(boxData: covidBoxData[_region]),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 20.0),
            sliver: SliverToBoxAdapter(
              child: RegionBarChart(covidCases: covidDailyNewCases[_region]),
            ),
          ),
        ],
      ),
    );
  }
}
