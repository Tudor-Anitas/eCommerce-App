import 'package:flutter/material.dart';

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
              onPressed: () {},
              child: Text(
                'Finish',
                style: Theme.of(context).textTheme.button,
              )),
        )
      ],
    );
  }
}
