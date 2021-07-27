import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/item_details_page/glass_add_to_cart_button.dart';
import 'package:test_project/screens/item_details_page/label_value_item_detail.dart';

class DetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Consumer<ItemProvider>(
      builder: (_, provider, __) => ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(
            height: windowHeight * 0.5,
            width: windowWidth * 0.9,
            padding: EdgeInsets.symmetric(
                horizontal: windowWidth * 0.05, vertical: windowHeight * 0.02),
            margin: EdgeInsets.only(top: windowHeight * 0.025),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1.5,
                  color: Theme.of(context).cardColor.withOpacity(0.2),
                )),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: windowHeight * 0.05),
                  child: Text(
                    provider.selectedItem!.productName!,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                LabelValueItemDetail(
                    label: 'color', value: provider.selectedItem!.color!),
                LabelValueItemDetail(
                    label: 'material', value: provider.selectedItem!.material!),
                LabelValueItemDetail(
                    label: 'category',
                    value: provider.selectedItem!.department!),
                LabelValueItemDetail(
                    label: 'promo code',
                    value: provider.selectedItem!.promoCode!),
                Container(
                  margin: EdgeInsets.only(top: windowHeight * 0.07),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: windowWidth * 0.3,
                        child: Text(
                          '${provider.selectedItem!.price!.toString()} lei',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                      Container(
                          width: windowWidth * 0.3,
                          child: GlassAddToCartButton())
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
