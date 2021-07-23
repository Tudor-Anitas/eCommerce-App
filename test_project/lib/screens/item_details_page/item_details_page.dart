import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/item_details_page/details_card.dart';

class ItemDetailsPage extends StatefulWidget {
  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Stack(
        children: [
          Image.asset('category_background.jpg',
              width: windowWidth, height: windowHeight, fit: BoxFit.cover),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Consumer<ItemProvider>(
                  builder: (_, provider, __) => Container(
                    child: Column(
                      children: [
                        Container(
                          height: windowHeight * 0.33,
                          width: windowWidth,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      provider.selectedItem!.image!))),
                        ),
                        DetailsCard()
                      ],
                    ),
                  ),
                )),
          )
        ],
      ),
    );
  }
}
