import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/shooping_cart/cart_item.dart';
import 'package:test_project/screens/shooping_cart/check_out_button.dart';

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  double totalPrice = 0;
  ItemProvider? provider;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    provider = Provider.of<ItemProvider>(context);
  }

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Stack(children: [
      Image.asset(
        'home_page_background.jpg',
        width: windowWidth,
        height: windowHeight,
        fit: BoxFit.cover,
      ),
      BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Consumer<ItemProvider>(builder: (_, provider, __) {
            totalPrice = 0;
            provider.shoppingCart.forEach((element) {
              totalPrice += element.price!;
            });
            return Scaffold(
              backgroundColor: Colors.transparent,
              body: Container(
                width: windowWidth,
                height: windowHeight,
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: windowHeight * 0.03),
                      child: Text(
                        'Check out',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                    Container(
                      height: windowHeight * 0.77,
                      width: windowWidth * 0.8,
                      child: ListView.builder(
                          itemCount: provider.shoppingCart.length,
                          itemBuilder: (_, index) {
                            return Dismissible(
                              key: UniqueKey(),
                              direction: DismissDirection.endToStart,
                              onDismissed: (_) {
                                setState(() {
                                  provider.removeFromShoppingCart(provider
                                      .shoppingCart
                                      .elementAt(index)
                                      .id);
                                  showToast('Product removed from the cart!',
                                      context: context,
                                      animDuration: Duration(microseconds: 150),
                                      animation:
                                          StyledToastAnimation.slideFromBottom);
                                });
                              },
                              child: CartItem(
                                  provider.shoppingCart.elementAt(index)),
                            );
                          }),
                    ),
                    Container(
                      width: windowWidth * 0.8,
                      height: windowHeight * 0.07,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${totalPrice.toStringAsFixed(2)} lei'),
                          CheckOutButton()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }))
    ]));
  }
}
