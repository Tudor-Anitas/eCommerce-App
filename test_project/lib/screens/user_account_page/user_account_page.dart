import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/user_account_page/change_card_details_form.dart';
import 'package:test_project/screens/user_account_page/order_item.dart';
import 'package:test_project/screens/user_account_page/user_credit_card.dart';

class UserAccountPage extends StatefulWidget {
  @override
  _UserAccountPageState createState() => _UserAccountPageState();
}

class _UserAccountPageState extends State<UserAccountPage> {
  int _pageState = 0;
  double cardDetailsFormY = 0;

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;

    switch (_pageState) {
      case 0:
        cardDetailsFormY = windowHeight;
        break;
      case 1:
        if (MediaQuery.of(context).viewInsets.bottom != 0.0)
          cardDetailsFormY = windowHeight * 0.25;
        else
          cardDetailsFormY = windowHeight * 0.35;
        break;
    }

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
      child: Stack(
        children: [
          Scaffold(
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
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              print('page state' + _pageState.toString());
                              _pageState == 0 ? _pageState = 1 : _pageState = 0;
                            });
                          },
                          child: UserCreditCard()),
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
          ChangeCardDetailsForm(cardDetailsFormY)
        ],
      ),
    );
  }
}
