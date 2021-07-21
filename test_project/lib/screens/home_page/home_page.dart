import 'package:flutter/material.dart';
import 'package:test_project/screens/home_page/beer_list.dart';
import 'package:test_project/screens/home_page/theme_switch.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        //TODO app bar, safe area
        body: Column(
      children: [
        SizedBox(height: windowHeight * 0.03),
        ThemeSwitch(),
        Container(height: windowHeight * 0.9, child: BeerList()),
      ],
    ));
  }
}
