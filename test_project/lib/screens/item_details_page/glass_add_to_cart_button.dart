import 'package:flutter/material.dart';

class GlassAddToCartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: windowWidth * 0.3,
        height: windowHeight * 0.05,
        child: Center(child: Text('Add to cart')),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 1.5,
              color: Theme.of(context).cardColor.withOpacity(0.2),
            )),
      ),
    );
  }
}
