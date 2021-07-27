import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/models/item_model.dart';
import 'package:test_project/providers/item_provider.dart';

class CartItem extends StatefulWidget {
  final ItemModel currentItem;

  CartItem(this.currentItem);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
        child: Container(
          width: windowWidth,
          height: windowHeight * 0.15,
          //margin: EdgeInsets.only(bottom: windowHeight * 0.025),
          decoration: BoxDecoration(
              color: Theme.of(context).cardColor.withOpacity(0.2),
              border: Border.all(
                width: 1,
                color: Theme.of(context).cardColor.withOpacity(0.2),
              )),
          child: Row(
            children: [
              Container(
                width: windowWidth * 0.3,
                height: windowHeight * 0.2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(widget.currentItem.image!),
                        fit: BoxFit.cover)),
              ),
              Container(
                width: windowWidth * 0.49,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: windowWidth * 0.3,
                      child: Text(
                        '${widget.currentItem.productName}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${widget.currentItem.price} lei',
                    )
                  ],
                ),
              ),
              Consumer<ItemProvider>(builder: (_, provider, __) {
                return Container(
                  width: windowWidth * 0.15,
                  height: windowHeight * 0.035,
                  decoration: BoxDecoration(
                      color: Theme.of(context).backgroundColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        child: IconButton(
                          splashRadius: 5.0,
                          icon: Icon(
                            Icons.remove,
                            size: 10,
                          ),
                          onPressed: () {
                            if (provider.shoppingCart[widget.currentItem]! > 0) {
                              context
                                .read<ItemProvider>()
                                .substractQuantityInCart(widget.currentItem.id);
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                            alignment: Alignment.center,
                            child:
                                Text('${provider.shoppingCart[widget.currentItem]}')),
                      ),
                      Expanded(
                        child: IconButton(
                          icon: Icon(Icons.add, size: 10),
                          onPressed: () {
                            context
                                .read<ItemProvider>()
                                .addQuantityInCart(widget.currentItem.id);
                          },
                        ),
                      )
                    ],
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
