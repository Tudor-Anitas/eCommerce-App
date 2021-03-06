import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String? categoryName;
  final List<IconData> _icons = [
    Icons.code_outlined,
    Icons.receipt_outlined,
    Icons.supervisor_account_outlined,
    Icons.hourglass_empty_outlined,
    Icons.offline_bolt_outlined,
    Icons.invert_colors_outlined,
    Icons.anchor_outlined
  ];

  CategoryCard({this.categoryName});

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                      padding: EdgeInsets.only(
                          left: windowWidth * 0.03, right: windowWidth * 0.03),
                      margin: EdgeInsets.symmetric(
                          horizontal: windowWidth * 0.02,
                          vertical: windowHeight * 0.01),
                      decoration: BoxDecoration(
                          color: Theme.of(context).cardColor.withOpacity(0.3),
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          border: Border.all(
                            width: 1.5,
                            color: Theme.of(context).cardColor.withOpacity(0.2),
                          )),
                      child: Container(
                          child: Icon(
                        _icons[Random().nextInt(7)],
                        size: 70,
                      ))),
                ),
                Container(
                    height: windowHeight * 0.03,
                    child: Text(
                      categoryName!,
                    ))
              ],
            ),
          ),
        ));
  }
}
