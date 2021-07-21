import 'package:flutter/material.dart';
import 'package:test_project/screens/home_page/category_list.dart';
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
        body: SafeArea(
      child: Column(
        children: [
          ThemeSwitch(),
          Container(height: windowHeight * 0.9, child: CategoryList()),
        ],
      ),
    ));
  }
}
