import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/payment_page/payment_form/credit_form.dart';
import 'package:test_project/screens/payment_page/payment_form/wallet_form.dart';

class PaymentForm extends StatefulWidget {
  const PaymentForm({Key? key}) : super(key: key);

  @override
  _PaymentFormState createState() => _PaymentFormState();
}

class _PaymentFormState extends State<PaymentForm> {

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Consumer<ItemProvider>(
      builder: (_, provider, __) => Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            transform: Matrix4.translationValues(
                provider.paymentMethod == PaymentMethod.credit
                    ? windowWidth
                    : 0,
                0,
                1),
            width: windowWidth,
            height: windowHeight * 0.5,
            padding: EdgeInsets.symmetric(horizontal: windowWidth * 0.1),
            color: Colors.transparent,
            child: WalletForm()
          ),
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            transform: Matrix4.translationValues(
                provider.paymentMethod == PaymentMethod.wallet
                    ? -windowWidth
                    : 0,
                0,
                1),
            width: windowWidth,
            height: windowHeight * 0.45,
            padding: EdgeInsets.symmetric(horizontal: windowWidth * 0.05, vertical: windowHeight * 0.05),
            color: Colors.transparent,
            child: CreditForm()
          ),
        ],
      ),
    );
  }
}
