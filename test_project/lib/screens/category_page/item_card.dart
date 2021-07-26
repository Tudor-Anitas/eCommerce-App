import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:test_project/models/item_model.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/category_page/add_to_cart_button.dart';
import 'package:test_project/screens/item_details_page/item_details_page.dart';

class ItemCard extends StatelessWidget {
  final ItemModel? currentItem;

  ItemCard(this.currentItem);

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Provider.of<ItemProvider>(context, listen: false)
            .setSelectedItem(currentItem!.id);
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.fade,
                curve: Curves.easeInOutQuart,
                child: ItemDetailsPage()));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(
            margin: EdgeInsets.all(windowHeight * 0.01),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  width: 1.5,
                  color: Theme.of(context).cardColor.withOpacity(0.2),
                )),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: NetworkImage(currentItem!.image!),
                            fit: BoxFit.fill)),
                  ),
                ),
                AspectRatio(
                    aspectRatio: 1 / 1.05,
                    child: Container(
                      padding: EdgeInsets.only(top: windowHeight * 0.03),
                      child: Column(
                        children: [
                          Container(
                              child: Text(
                            currentItem!.productName!,
                            textAlign: TextAlign.center,
                          )),
                          Text(currentItem!.color!),
                          Text(currentItem!.material!),
                          Text(
                            '${currentItem!.price!.toString()} ron',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          AddToCartButton(currentItem!)
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
