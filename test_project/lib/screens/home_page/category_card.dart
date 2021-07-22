import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String? categoryName;

  CategoryCard({this.categoryName});

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.zero,
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
              height: windowHeight * 0.25,
              padding: EdgeInsets.only(
                  top: windowHeight * 0.03,
                  left: windowWidth * 0.03,
                  right: windowWidth * 0.03),
              margin: EdgeInsets.symmetric(
                  horizontal: windowWidth * 0.02,
                  vertical: windowHeight * 0.01),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                  stops: [0.0, 1.0],
                  colors: [
                  Theme.of(context).cardColor.withOpacity(0.5),
                  Theme.of(context).cardColor.withOpacity(0.2),
                ]),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                        width: 1.5,
                        color: Theme.of(context).cardColor.withOpacity(0.2),
                      )
              ),
              child: Text(
                categoryName!,
                style: Theme.of(context).textTheme.headline5,
              ))),
    );
  }
}
