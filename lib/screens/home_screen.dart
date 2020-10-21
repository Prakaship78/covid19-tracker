import 'package:covid19_tracker/screens/help_section.dart';
import 'package:covid19_tracker/screens/world_screen.dart';
import 'package:covid19_tracker/widgets/help_card.dart';
import 'package:covid19_tracker/widgets/info.dart';
import 'package:covid19_tracker/widgets/prevention_card.dart';
import 'package:flutter/material.dart';
import 'package:covid19_tracker/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List indiaData;

  Future fetchIndiaData() async {
    http.Response response = await http
        .get('https://covid-19india-api.herokuapp.com/v2.0/country_data');
    setState(() {
      indiaData = json.decode(response.body);
    });
    print(indiaData);
  }

  @override
  void initState() {
    super.initState();
    fetchIndiaData();
  }

  @override
  void dispose() {
    super.dispose();
    fetchIndiaData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: Colors.white,
                  onPressed: () {},
                  child: Text(
                    "India",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
        elevation: 0,
      ),
      drawer: Drawer(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ListTile(
            title: Text(
              'Home',
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
          ),
          ListTile(
            title: Text(
              'World Wide',
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorldData(),
                  ));
            },
          ),
          ListTile(
            title: Text(
              'Help',
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HelpSection(),
                  ));
            },
          ),
        ],
      )),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kPrimaryColor.withOpacity(0.03),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50))),
                child: indiaData == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                        child: SingleChildScrollView(
                          child: Wrap(
                            runSpacing: 20,
                            spacing: 20,
                            children: [
                              InfoCard(
                                title: 'Confirmed Cases',
                                iconColor: Color(0xFFFF8C00),
                                effectedNum:
                                    indiaData[1]['confirmed_cases'].toString(),
                                increase: ' ',
                                percent: ' ',
                                expanded_icon_color: Colors.white,
                              ),
                              InfoCard(
                                title: 'Active Cases',
                                iconColor: Color(0xFF5856D6),
                                effectedNum:
                                    indiaData[1]['active_cases'].toString(),
                                increase: indiaData[1]
                                        ['delta_change_active_cases']
                                    .toString(),
                                percent: indiaData[1]['active_rate'].toString(),
                                expanded_icon_color: Colors.black,
                              ),
                              InfoCard(
                                title: 'Total Recovered',
                                iconColor: Color(0xFF50E3C2),
                                effectedNum:
                                    indiaData[1]['recovered_cases'].toString(),
                                increase: indiaData[1]
                                        ['delta_change_recovered_cases']
                                    .toString(),
                                percent:
                                    "${indiaData[1]['recovered_rate'].toString()} %",
                                expanded_icon_color: Colors.black,
                              ),
                              InfoCard(
                                title: 'Total Deaths',
                                iconColor: Color(0xFFFF2D55),
                                effectedNum:
                                    indiaData[1]['death_cases'].toString(),
                                increase: indiaData[1]
                                        ['delta_change_death_cases']
                                    .toString(),
                                percent:
                                    '${indiaData[1]['death_rate'].toString()} %',
                                expanded_icon_color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preventions',
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    BuildPreventions(),
                    SizedBox(
                      height: 50,
                    ),
                    HelpCard(),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
