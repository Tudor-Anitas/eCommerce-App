import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';

class UserCreditCard extends StatelessWidget {
  final Map<int, List<Color>> gradientColors = {
    0: [Color(0xffDA4453), Color(0xff89216B)],
    1: [Color(0xff283c86), Color(0xff45a247)],
    2: [Color(0xffad5389), Color(0xff3c1053)],
    3: [Color(0xff000046), Color(0xff1CB5E0)],
  };

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    int randomGradientNumber = Random().nextInt(4);
    return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(
            width: windowWidth * 0.8,
            height: windowHeight * 0.23,
            padding: EdgeInsets.symmetric(
                horizontal: windowWidth * 0.05, vertical: windowHeight * 0.02),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                gradientColors[randomGradientNumber]![0],
                gradientColors[randomGradientNumber]![1]
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            child: Consumer<ItemProvider>(
              builder: (_, provider, __) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          top: windowHeight * 0.04,
                          bottom: windowHeight * 0.01),
                      //color: Colors.amber,
                      child: Text(
                        '**** **** **** ${provider.customer?.creditCardModel?.cardNumber?.substring(15) ?? '****'}',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Card Holder'),
                            Text(
                              '${provider.customer?.creditCardModel?.cardHolderName ?? ' '}',
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Expiration Date'),
                            Text(
                              '${provider.customer?.creditCardModel?.expirationDate ?? ' '}',
                              style: Theme.of(context).textTheme.caption,
                            )
                          ],
                        )
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ));
  }
}
