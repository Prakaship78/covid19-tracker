import 'package:covid19_tracker/constants.dart';
import 'package:covid19_tracker/screens/details.dart';
import 'package:covid19_tracker/screens/help_section.dart';
import 'package:covid19_tracker/screens/home_screen.dart';
import 'package:covid19_tracker/screens/world_screen.dart';
import 'package:covid19_tracker/widgets/faq.dart';
import 'package:covid19_tracker/widgets/info.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Covid-19 Tracker',
      debugShowCheckedModeBanner: false,
      // darkTheme: ThemeData.dark(),
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: kBackgroundColor,
          textTheme:
              Theme.of(context).textTheme.apply(displayColor: kTextColor)),
      home: HomeScreen(),
    );
  }
}
