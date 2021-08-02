import 'dart:ui';

import 'package:flutter/material.dart';

class UserCreditCard extends StatelessWidget {
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
                Container(
                  width: windowWidth * 0.8,
                  height: windowHeight * 0.23,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor.withOpacity(0.3),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(
                        width: 1.5,
                        color: Theme.of(context).cardColor.withOpacity(0.2),
                      )),
                )
              ],
            ),
          ),
        ));
  }
}
