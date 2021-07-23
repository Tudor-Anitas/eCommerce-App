import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_project/screens/home_page/category_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;
    return Stack(children: [
      Image.asset(
        'home_page_background.jpg',
        width: windowWidth,
        height: windowHeight,
        fit: BoxFit.cover,
      ),
      BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 30),
                        child: Text(
                          'Categories',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                      //ThemeSwitch(),
                      IconButton(
                        icon: Icon(Icons.shopping_bag, size: 30),
                        onPressed: () {},
                      )
                    ],
                  ),
                  Container(height: windowHeight * 0.88, child: CategoryList()),
                ],
              ),
            )),
      ),
    ]);
  }
}
