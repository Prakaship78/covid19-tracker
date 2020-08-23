import 'package:flutter/material.dart';
import 'package:tgd_covid_tracker/HomePage.dart';
import 'package:tgd_covid_tracker/datasource.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Circular', primaryColor: primaryBlack),
      home: HomePage(),
    );
  }
}
