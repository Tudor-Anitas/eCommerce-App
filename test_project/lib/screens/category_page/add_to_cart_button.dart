import 'package:flutter/material.dart';

class AddToCartButton extends StatefulWidget {
  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: windowWidth * 0.05),
      child: MaterialButton(
          color: Theme.of(context).backgroundColor,
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_shopping_cart_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              Text('Add to cart', style: Theme.of(context).textTheme.bodyText2)
            ],
          )),
    );
  }
}
