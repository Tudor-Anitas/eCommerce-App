import 'package:flutter/material.dart';
import 'package:test_project/screens/home_page/category_list.dart';
import 'package:test_project/screens/home_page/theme_switch.dart';
import 'package:test_project/screens/item_details_page/item_details_page.dart';

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetailsPage())),
                              child: Text(
                  'Categories',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
              ThemeSwitch(),
            ],
          ),
          Container(height: windowHeight * 0.88, child: CategoryList()),
        ],
      ),
    ));
  }
}
