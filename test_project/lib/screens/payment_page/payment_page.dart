import 'package:flutter/material.dart';
import 'package:test_project/screens/payment_page/payment_form/payment_form.dart';
import 'package:test_project/screens/payment_page/payment_header.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    super.initState();
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    if (MediaQuery.of(context).viewInsets.bottom != 0) {
      _animationController!.reverse();
    } else {
      _animationController!.forward();
    }
    return SafeArea(
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
              SizeTransition(
                sizeFactor: _animationController!,
                child: Container(
                    height: windowHeight * 0.3, child: PaymentHeader()),
              ),
              PaymentForm(),
              Container(
                alignment: Alignment.center,
                width: windowWidth * 0.8,
                height: windowHeight * 0.07,
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Text('Pay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
