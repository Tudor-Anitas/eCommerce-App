import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:test_project/screens/payment_page/payment_page.dart';

class CheckOutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Container(
          width: windowWidth * 0.3,
          height: windowHeight * 0.07,
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                width: 1.5,
                color: Theme.of(context).cardColor.withOpacity(0.2),
              )),
          child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                        child: PaymentPage(),
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 350)));
              },
              child: Text(
                'Check out',
                style: Theme.of(context).textTheme.button,
              )),
        ),
      ),
    );
  }
}
