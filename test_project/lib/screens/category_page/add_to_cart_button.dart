import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:test_project/models/item_model.dart';
import 'package:test_project/providers/item_provider.dart';

class AddToCartButton extends StatefulWidget {
  final ItemModel currentItem;

  AddToCartButton(this.currentItem);

  @override
  _AddToCartButtonState createState() => _AddToCartButtonState();
}

class _AddToCartButtonState extends State<AddToCartButton> {
  ItemProvider? provider;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of<ItemProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: windowWidth * 0.05),
      child: MaterialButton(
          color: provider!.shoppingCart.contains(widget.currentItem.id)
              ? Theme.of(context).toggleableActiveColor
              : Theme.of(context).backgroundColor,
          onPressed: () {
            if (!provider!.shoppingCart.contains(widget.currentItem)) {
              Provider.of<ItemProvider>(context, listen: false)
                  .addToShoppingCart(widget.currentItem.id);
              showToast('Product added to shopping cart!',
                  context: context,
                  animation: StyledToastAnimation.slideFromBottom);
              setState(() {});
            } else {
              Provider.of<ItemProvider>(context, listen: false)
                  .removeFromShoppingCart(widget.currentItem.id);
              showToast('Product removed!',
                  context: context,
                  animDuration: Duration(milliseconds: 150),
                  animation: StyledToastAnimation.slideFromBottomFade);
              setState(() {});
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                provider!.shoppingCart.contains(widget.currentItem)
                    ? Icons.done
                    : Icons.add_shopping_cart_outlined,
                color: Theme.of(context).iconTheme.color,
              ),
              provider!.shoppingCart.contains(widget.currentItem)
                  ? Text('Remove', style: Theme.of(context).textTheme.bodyText2)
                  : Text('Add to cart',
                      style: Theme.of(context).textTheme.bodyText2)
            ],
          )),
    );
  }
}
