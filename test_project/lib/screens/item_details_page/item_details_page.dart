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
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Consumer<ItemProvider>(
            builder: (_, provider, __) => Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text(provider.selectedItem!.productName!),
              ),
              body: Container(
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
                    Container(
                      height: windowHeight * 0.33,
                      width: windowWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.network(
                        provider.selectedItem!.image!,
                        fit: BoxFit.cover,
                        loadingBuilder: (_, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          }
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )),
                    DetailsCard()
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
