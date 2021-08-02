import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';

class PaymentHeader extends StatefulWidget {
  @override
  _PaymentHeaderState createState() => _PaymentHeaderState();
}

class _PaymentHeaderState extends State<PaymentHeader> {
  BoxShadow elevatedShadow = BoxShadow(
      offset: Offset(0, 5),
      blurRadius: 20,
      spreadRadius: 0,
      color: Colors.grey[900]!.withOpacity(0.5));
  @override
  Widget build(BuildContext context) {
    double windowHeight = MediaQuery.of(context).size.height;
    double windowWidth = MediaQuery.of(context).size.width;
    return Consumer<ItemProvider>(
      builder: (_, provider, __) => Container(
        width: windowWidth,
        padding: EdgeInsets.symmetric(
            horizontal: windowWidth * 0.05, vertical: windowHeight * 0.02),
        //color: Colors.amber,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Total price'),
            Text('${provider.totalCartPrice!.toStringAsFixed(2)} lei',
                style: Theme.of(context).textTheme.headline2),
            Container(
                margin: EdgeInsets.only(bottom: windowHeight * 0.01),
                child: Text('Payment method')),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    context
                        .read<ItemProvider>()
                        .setPaymentMethod(PaymentMethod.credit);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    width: windowWidth * 0.3,
                    height: windowHeight * 0.07,
                    margin: EdgeInsets.only(right: windowWidth * 0.02),
                    decoration: BoxDecoration(
                        color: provider.paymentMethod == PaymentMethod.credit
                            ? Theme.of(context).backgroundColor
                            : Theme.of(context)
                                .backgroundColor
                                .withOpacity(0.75),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          provider.paymentMethod == PaymentMethod.credit
                              ? elevatedShadow
                              : BoxShadow(color: Colors.transparent)
                        ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('Credit'), Icon(Icons.check_circle_outline_outlined)],
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    context
                        .read<ItemProvider>()
                        .setPaymentMethod(PaymentMethod.wallet);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                    width: windowWidth * 0.3,
                    height: windowHeight * 0.07,
                    margin: EdgeInsets.only(left: windowWidth * 0.02),
                    decoration: BoxDecoration(
                        color: provider.paymentMethod == PaymentMethod.wallet
                            ? Theme.of(context).backgroundColor
                            : Theme.of(context)
                                .backgroundColor
                                .withOpacity(0.75),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          provider.paymentMethod == PaymentMethod.wallet
                              ? elevatedShadow
                              : BoxShadow(color: Colors.transparent)
                        ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('Wallet'), Icon(Icons.check_circle_outline_outlined)],
                        ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
