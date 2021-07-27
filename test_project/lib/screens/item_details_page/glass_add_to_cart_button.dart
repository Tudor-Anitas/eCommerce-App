import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';

class GlassAddToCartButton extends StatefulWidget {
  @override
  _GlassAddToCartButtonState createState() => _GlassAddToCartButtonState();
}

class _GlassAddToCartButtonState extends State<GlassAddToCartButton> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Consumer<ItemProvider>(builder: (_, provider, __) {
      bool _isItemInCart =
          provider.shoppingCart.keys.contains(provider.selectedItem);
      return GestureDetector(
        onTap: () {
          if (!_isItemInCart) {
            Provider.of<ItemProvider>(context, listen: false)
                .addToShoppingCart(provider.selectedItem!.id);
            showToast('Product added to shopping cart!',
                context: context,
                animDuration: Duration(milliseconds: 150),
                animation: StyledToastAnimation.slideFromBottom);
            
          } else {
            Provider.of<ItemProvider>(context, listen: false)
                .removeFromShoppingCart(provider.selectedItem!.id);
            showToast('Product removed from cart!',
                context: context,
                animDuration: Duration(milliseconds: 150),
                animation: StyledToastAnimation.slideFromBottomFade);
            
          }
        },
        child: Container(
          width: windowWidth * 0.3,
          height: windowHeight * 0.05,
          child: Center(child: Text('Add to cart')),
          decoration: BoxDecoration(
              color: _isItemInCart
                  ? Theme.of(context).toggleableActiveColor.withOpacity(0.2)
                  : Theme.of(context).cardColor.withOpacity(0.2),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1.5,
                color: Theme.of(context).cardColor.withOpacity(0.2),
              )),
        ),
      );
    });
  }
}
