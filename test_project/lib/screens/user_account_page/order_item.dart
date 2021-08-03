import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/models/item_model.dart';
import 'package:test_project/providers/item_provider.dart';

class OrderItem extends StatelessWidget {
  final ItemModel? _currentItem;
  
  OrderItem(this._currentItem);

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          width: windowWidth * 0.8,
          height: windowHeight * 0.08,
          margin: EdgeInsets.only(bottom: windowHeight * 0.01),
          padding: EdgeInsets.symmetric(horizontal: windowWidth * 0.05),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 1,
                color: Theme.of(context).cardColor.withOpacity(0.2),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  child: Row(
                children: [
                  Text('Date: '),
                  Container(
                    width: windowWidth * 0.3,
                    child: Text(Provider.of<ItemProvider>(context, listen: false)
                        .customer!
                        .orderHistory![_currentItem]![1]
                        .toString(), overflow: TextOverflow.ellipsis,),
                  ),
                ],
              )),
              Text('1000 RON')
            ],
          ),
        ),
      ),
    );
  }
}
