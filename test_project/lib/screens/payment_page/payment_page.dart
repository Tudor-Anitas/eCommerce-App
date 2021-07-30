import 'package:flutter/material.dart';
import 'package:test_project/screens/payment_page/payment_form/payment_form.dart';
import 'package:test_project/screens/payment_page/payment_header.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>
    with SingleTickerProviderStateMixin {

  double? _headerHeight;

  @override
  Widget build(BuildContext context) {
    //double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    _headerHeight = windowHeight * 0.3;

    if (MediaQuery.of(context).viewInsets.bottom != 0) {
      _headerHeight = 0;
    } else {
      _headerHeight = windowHeight * 0.3;
    }
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);
          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Theme.of(context).backgroundColor,
              Theme.of(context).scaffoldBackgroundColor
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              title: Text('Payment'),
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            body: Column(
              children: [
                AnimatedSize(
                  vsync: this,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                      height: _headerHeight, child: PaymentHeader()),
                ),
                PaymentForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
