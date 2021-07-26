import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:test_project/models/item_model.dart';

class CartItem extends StatelessWidget {
  final ItemModel currentItem;

  CartItem(this.currentItem);

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          width: windowWidth * 0.8,
          height: windowHeight * 0.15,
          margin: EdgeInsets.only(bottom: windowHeight * 0.025),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1.5,
                color: Theme.of(context).cardColor.withOpacity(0.2),
              )),
          child: Row(
            children: [
              Container(
                width: windowWidth * 0.3,
                height: windowHeight * 0.5,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(currentItem.image!),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: windowWidth * 0.49,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${currentItem.productName}', overflow: TextOverflow.ellipsis,),
                    Text('x1'),
                    Text(
                      '${currentItem.price} lei',
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
