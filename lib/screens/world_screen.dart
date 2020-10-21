import 'package:covid19_tracker/constants.dart';
import 'package:covid19_tracker/widgets/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'home_screen.dart';
import 'help_section.dart';

class WorldData extends StatefulWidget {
  @override
  _WorldDataState createState() => _WorldDataState();
}

class _WorldDataState extends State<WorldData> {
  var data;

  Future fetchCountryData() async {
    http.Response response =
        await http.get('https://api.covid19api.com/summary');
    if (response.statusCode == 200) {
      setState(() {
        data = json.decode(response.body);
        // print(data['Global']['NewConfirmed']);
        // print(data['Countries'][1]['Country']);
      });
    } else {
      throw Exception();
    }
  }

  @override
  void dispose() {
    super.dispose();
    fetchCountryData();
  }

  @override
  void initState() {
    super.initState();
    fetchCountryData();
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
                    "World Wide",
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
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
          ),
          ListTile(
            title: Text('World Wide'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorldData(),
                  ));
            },
          ),
          ListTile(
            title: Text('Help'),
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
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.03),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: data == null
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
                                  data['Global']['TotalConfirmed'].toString(),
                              expanded_icon_color: Colors.white,
                              increase: '',
                              percent: '',
                            ),
                            InfoCard(
                              title: 'Total Recovered',
                              iconColor: Color(0xFF50E3C2),
                              effectedNum:
                                  data['Global']['TotalRecovered'].toString(),
                              expanded_icon_color: Colors.white,
                              increase: '',
                              percent: '',
                            ),
                            InfoCard(
                              title: 'Total Deaths',
                              iconColor: Color(0xFFFF2D55),
                              effectedNum:
                                  data['Global']['TotalDeaths'].toString(),
                              expanded_icon_color: Colors.white,
                              increase: '',
                              percent: '',
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
            SizedBox(
              height: 55,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Affected Countries',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.03),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: data == null
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      physics: ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 189,
                      itemBuilder: (context, i) {
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(10),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(20)),
                              child: ListTile(
                                tileColor: Colors.white,
                                title: Text(
                                  data['Countries'][i]['Country'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                subtitle: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: RichText(
                                            text: buildTextSpan(
                                                i,
                                                'Total Confirmed: ',
                                                data['Countries'][i]
                                                        ['TotalConfirmed']
                                                    .toString())),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: RichText(
                                            text: buildTextSpan(
                                                i,
                                                'Total Deaths: ',
                                                data['Countries'][i]
                                                        ['TotalDeaths']
                                                    .toString())),
                                      ),
                                    ),
                                    Flexible(
                                      child: Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: RichText(
                                            text: buildTextSpan(
                                                i,
                                                'Total Recovered: ',
                                                data['Countries'][i]
                                                        ['TotalRecovered']
                                                    .toString())),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
            )
          ],
        ),
      ),
    );
  }

  TextSpan buildTextSpan(int i, String type, String data) {
    return TextSpan(
        text: type,
        style: TextStyle(color: Colors.black),
        children: [TextSpan(text: data, style: TextStyle(color: Colors.blue))]);
  }
}
