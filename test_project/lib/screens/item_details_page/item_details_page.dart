import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/item_details_page/details_card.dart';
import 'package:transparent_image/transparent_image.dart';

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
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(),
            body: Consumer<ItemProvider>(
              builder: (_, provider, __) => Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Theme.of(context).backgroundColor,
                    Theme.of(context).scaffoldBackgroundColor
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )),
                child: Column(
                  children: [
                    Stack(children: [
                      Container(
                          height: windowHeight * 0.33,
                          width: windowWidth,
                          child: Center(
                            child: CircularProgressIndicator(),
                          )),
                      Container(
                        height: windowHeight * 0.33,
                        width: windowWidth,
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: provider.selectedItem!.image!,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ]),
                    DetailsCard()
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
