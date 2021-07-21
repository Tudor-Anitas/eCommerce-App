import 'package:flutter/material.dart';
import 'package:test_project/models/item_model.dart';

class ItemCard extends StatelessWidget {
  final ItemModel? currentItem;

  ItemCard(this.currentItem);

  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    print(currentItem!.image!);
    return Container(
      margin: EdgeInsets.all(windowHeight * 0.01),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [BoxShadow(offset: Offset(2, 2), blurRadius: 4.0)]),
      child: Column(
        children: [
          // TODO find a better image API
          AspectRatio(
            aspectRatio: 1 / 1,
            //child: Image.network(currentItem!.image!)
          ),
          AspectRatio(aspectRatio: 1 / 1, child: Container(
            child: Column(
              children: [
                Text(currentItem!.productName!),
                Text(currentItem!.color!),
                Text(currentItem!.material!),
                Text(currentItem!.price!.toString(),style: Theme.of(context).textTheme.subtitle1,)
              ],
            ),
            ))
        ],
      ),
    );
  }
}
