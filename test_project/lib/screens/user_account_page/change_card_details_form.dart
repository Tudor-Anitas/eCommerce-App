import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:hive/hive.dart';
import 'package:pattern_formatter/numeric_formatter.dart';
import 'package:provider/provider.dart';
import 'package:test_project/components/form_input.dart';
import 'package:test_project/components/form_validators.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/payment_page/payment_form/text_formatters/expiration_date_formatter.dart';

class ChangeCardDetailsForm extends StatefulWidget {
  double? yPosition;

  ChangeCardDetailsForm(this.yPosition);

  @override
  _ChangeCardDetailsFormState createState() => _ChangeCardDetailsFormState();
}

class _ChangeCardDetailsFormState extends State<ChangeCardDetailsForm> {
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expirationDateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  TextEditingController _cardHolderController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      transform: Matrix4.translationValues(0, widget.yPosition!, 1),
      height: windowHeight * 0.75,
      width: windowWidth,
      padding: EdgeInsets.symmetric(
          horizontal: windowWidth * 0.1, vertical: windowHeight * 0.05),
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          border: Border.all(
            width: 1.5,
            color: Theme.of(context).cardColor.withOpacity(0.2),
          )),
      child: Card(
        color: Colors.transparent,
        elevation: 0,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Card number'),
              FormInputField(
                controller: _cardNumberController,
                validator: InputValidators().creditCardNumber,
                inputType: TextInputType.number,
                textFormatters: [
                  LengthLimitingTextInputFormatter(19),
                  CreditCardFormatter()
                ],
                icon: Icon(
                  Icons.credit_card,
                  size: 30,
                  color: Theme.of(context).accentColor,
                ),
                hint: '**** **** **** ****',
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: windowHeight * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: windowWidth * 0.35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Valid until'),
                            FormInputField(
                              controller: _expirationDateController,
                              inputType: TextInputType.number,
                              validator: InputValidators().cardValidityPeriod,
                              textFormatters: [
                                CardExpirationDateFormatter(),
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9/]')),
                                LengthLimitingTextInputFormatter(5)
                              ],
                              hint: 'Month/Year',
                            ),
                          ],
                        )),
                    Container(
                        width: windowWidth * 0.35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('CVV'),
                            FormInputField(
                              controller: _cvvController,
                              inputType: TextInputType.number,
                              validator: InputValidators().cvv,
                              textFormatters: [
                                LengthLimitingTextInputFormatter(3),
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9]')),
                              ],
                              hint: '***',
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Card holder'),
                  FormInputField(
                    controller: _cardHolderController,
                    validator: InputValidators().cardHolderName,
                    inputType: TextInputType.name,
                    textFormatters: [
                      FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))
                    ],
                    hint: 'First and last name',
                  ),
                ],
              ),
              Container(
                width: windowWidth,
                height: windowHeight * 0.07,
                margin: EdgeInsets.only(top: windowHeight * 0.1),
                decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: BorderRadius.circular(30)),
                child: TextButton(
                    onPressed: () async {
                      if (_formKey.currentState != null &&
                          _formKey.currentState!.validate()) {
                        Provider.of<ItemProvider>(context, listen: false)
                            .addCreditCard(
                                _cardNumberController.text.trim(),
                                _expirationDateController.text,
                                _cvvController.text,
                                _cardHolderController.text.trim());

                        if (Provider.of<ItemProvider>(context, listen: false)
                                .customer!
                                .email !=
                            null) {
                          final FlutterSecureStorage secureStorage =
                              const FlutterSecureStorage();
                          var encryptionKey = base64Url
                              .decode((await secureStorage.read(key: 'key'))!);
                          var box = await Hive.openBox('accounts',
                              encryptionCipher: HiveAesCipher(encryptionKey));
                          box.put(
                              Provider.of<ItemProvider>(context, listen: false)
                                  .customer!
                                  .email,
                              Provider.of<ItemProvider>(context, listen: false)
                                  .customer!);

                          showToast('Card details saved!',
                              context: context,
                              animDuration: Duration(microseconds: 350),
                              animation:
                                  StyledToastAnimation.slideFromBottomFade);
                          _cardHolderController.clear();
                          _cardNumberController.clear();
                          _expirationDateController.clear();
                          _cvvController.clear();
                        }
                      } else {
                        showToast('Incorrect data given',
                            context: context,
                            animDuration: Duration(microseconds: 350),
                            animation:
                                StyledToastAnimation.slideFromBottomFade);
                      }
                    },
                    child: Text(
                      'Save',
                      style: Theme.of(context).textTheme.button,
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
