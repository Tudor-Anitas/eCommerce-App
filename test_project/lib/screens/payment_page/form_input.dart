import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

enum FormInputType {
  cardNumber,
  validPeriod,
  cvv,
  clientName,
  city,
  street,
  phoneNumber
}

class FormInput extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? inputType;
  final FormInputType fieldType;
  final String? hint;

  FormInput(
      {required this.controller,
      this.inputType = TextInputType.number,
      this.hint = '',
      required this.fieldType});

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter>? textFormaters = [];

    switch (fieldType) {
      case FormInputType.cardNumber:
        textFormaters
          ..add(LengthLimitingTextInputFormatter(19))
          ..add(CreditCardFormatter());
        break;
      case FormInputType.validPeriod:
        textFormaters.add(LengthLimitingTextInputFormatter(5));
        break;
      case FormInputType.cvv:
        textFormaters
          ..add(LengthLimitingTextInputFormatter(3))
          ..add(FilteringTextInputFormatter.allow(RegExp('[0-9]')));
        break;
      case FormInputType.clientName:
        break;
      case FormInputType.city:
        break;
      case FormInputType.street:
        break;
      case FormInputType.phoneNumber:
        break;
    }
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          fieldType == FormInputType.cardNumber
              ? Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.credit_card,
                    size: 30,
                    color: Theme.of(context).accentColor,
                  ))
              : Expanded(
                  flex: 0,
                  child: Container(),
                ),
          Expanded(
            flex: 9,
            child: TextFormField(
              controller: controller,
              style:
                  TextStyle(color: Theme.of(context).accentColor, fontSize: 16),
              keyboardType: inputType,
              inputFormatters: textFormaters,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hint,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
