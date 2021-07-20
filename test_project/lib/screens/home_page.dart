import 'package:flutter/material.dart';
import 'package:test_project/components/list_builder.dart';
import 'package:test_project/components/theme_switch.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Column(
      children: [
        SizedBox(height: windowHeight * 0.03),
        ThemeSwitch(),
        Container(height: windowHeight * 0.9, child: ListBuilder()),
      ],
    ));
  }
}
