import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/user_account_page/order_item.dart';
import 'package:test_project/screens/user_account_page/user_credit_card.dart';

class UserAccountPage extends StatefulWidget {
  @override
  _UserAccountPageState createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [
          Theme.of(context).scaffoldBackgroundColor,
          Theme.of(context).backgroundColor,
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text('Your account'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          width: windowWidth,
          child: SafeArea(
            child: Consumer<ItemProvider>(
              builder: (_, provider, __) => Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserCreditCard(),
                  Container(
                      height: windowHeight * 0.6,
                      width: windowWidth * 0.8,
                      margin: EdgeInsets.only(top: windowHeight * 0.05),
                      child: ListView.builder(
                          itemCount:
                              provider.customer?.orderHistory?.length ?? 0,
                          itemBuilder: (_, index) {
                            return OrderItem(provider
                                .customer!.orderHistory!.keys
                                .elementAt(index));
                          }))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
