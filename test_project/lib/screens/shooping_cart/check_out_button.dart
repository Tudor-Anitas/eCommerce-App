import 'dart:ui';

import 'package:flutter/material.dart';

class CheckOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          width: windowWidth * 0.3,
          height: windowHeight * 0.07,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1.5,
                color: Theme.of(context).cardColor.withOpacity(0.2),
              )),
          child: Center(child: Text('Check out')),
        ),
      ),
    );
  }
}
