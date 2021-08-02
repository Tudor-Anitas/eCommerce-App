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
        child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: Consumer<ItemProvider>(builder: (_, provider, __) {
              return Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  title: Text('Check out'),
                ),
                body: Container(
                  width: windowWidth,
                  height: windowHeight,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Theme.of(context).backgroundColor,
                      Theme.of(context).scaffoldBackgroundColor
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )),
                  child: Column(
                    children: [
                      Container(
                        height: windowHeight * 0.77,
                        width: windowWidth,
                        child: ListView.builder(
                            itemCount: provider.shoppingCart.length,
                            itemBuilder: (_, index) {
                              return Dismissible(
                                key: UniqueKey(),
                                direction: DismissDirection.endToStart,
                                onDismissed: (_) {
                                  provider.removeFromShoppingCart(provider
                                      .shoppingCart.keys
                                      .elementAt(index)
                                      .id);
                                  showToast('Product removed from the cart!',
                                      context: context,
                                      animDuration: Duration(microseconds: 150),
                                      animation:
                                          StyledToastAnimation.slideFromBottom);
                                },
                                child: CartItem(provider.shoppingCart.keys
                                    .elementAt(index)),
                              );
                            }),
                      ),
                      Container(
                        width: windowWidth * 0.8,
                        height: windowHeight * 0.07,
                        margin: EdgeInsets.only(top: windowHeight * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                                'Total price: ${provider.totalCartPrice!.toStringAsFixed(2)} lei',
                                style: Theme.of(context).textTheme.subtitle2),
                            CheckOutButton()
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            })));
  }
}
