import 'package:flutter/material.dart';
import 'package:test_project/models/item_model.dart';
import 'package:test_project/screens/category_page/add_to_cart_button.dart';

class ItemCard extends StatelessWidget {
  final ItemModel? currentItem;

  ItemCard(this.currentItem);

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.all(windowHeight * 0.01),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [BoxShadow(offset: Offset(2, 2), blurRadius: 4.0)]),
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
                    AddToCartButton()
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
