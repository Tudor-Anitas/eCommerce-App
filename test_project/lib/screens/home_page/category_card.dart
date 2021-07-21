import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String? categoryName;

  CategoryCard({this.categoryName});

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Container(
        height: windowHeight * 0.25,
        padding: EdgeInsets.only(top: windowHeight * 0.03, left: windowWidth * 0.03),
        margin: EdgeInsets.symmetric(
            horizontal: windowWidth * 0.02, vertical: windowHeight * 0.01),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [BoxShadow(offset: Offset(2, 2), blurRadius: 4.0)],
        ),
        child: Text(categoryName!, style: Theme.of(context).textTheme.headline5,));
  }
}
