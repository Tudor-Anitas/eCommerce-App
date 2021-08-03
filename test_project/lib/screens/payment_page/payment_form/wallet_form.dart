import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';

class WalletForm extends StatefulWidget {
  const WalletForm({Key? key}) : super(key: key);

  @override
  _WalletFormState createState() => _WalletFormState();
}

class _WalletFormState extends State<WalletForm> {
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'The payment will be done when the package is received by you at the courier'),
        Container(
          width: windowWidth,
          height: windowHeight * 0.07,
          margin: EdgeInsets.only(top: windowHeight * 0.3),
          decoration: BoxDecoration(
              color: Theme.of(context).backgroundColor,
              borderRadius: BorderRadius.circular(30)),
          child: TextButton(
              onPressed: () async {
                Provider.of<ItemProvider>(context, listen: false)
                    .addItemsToOrderHistory();

                if (Provider.of<ItemProvider>(context, listen: false).customer!.email !=
                    null) {
                  final FlutterSecureStorage secureStorage =
                      const FlutterSecureStorage();
                  var encryptionKey =
                      base64Url.decode((await secureStorage.read(key: 'key'))!);
                  var box = await Hive.openBox('accounts',
                      encryptionCipher: HiveAesCipher(encryptionKey));
                  box.put(Provider.of<ItemProvider>(context, listen: false).customer!.email,
                      Provider.of<ItemProvider>(context, listen: false).customer!);

                  showToast('Order placed successfully',
                      context: context,
                      animDuration: Duration(microseconds: 350),
                      animation: StyledToastAnimation.slideFromBottomFade);
                }
              },
              child: Text(
                'Finish',
                style: Theme.of(context).textTheme.button,
              )),
        )
      ],
    );
  }
}
