import 'package:flutter/material.dart';
import 'package:test_project/screens/payment_page/form_input.dart';

class CreditForm extends StatefulWidget {
  const CreditForm({Key? key}) : super(key: key);

  @override
  _CreditFormState createState() => _CreditFormState();
}

class _CreditFormState extends State<CreditForm> {
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _validPeriodController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();
  TextEditingController _cardHolderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Card number'),
        FormInput(
          controller: _cardNumberController,
          fieldType: FormInputType.cardNumber,
          hint: '**** **** **** ****',
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: windowHeight * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: windowWidth * 0.44,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Valid until'),
                      FormInput(
                        controller: _validPeriodController,
                        fieldType: FormInputType.validPeriod,
                        hint: 'Month/Year',
                      ),
                    ],
                  )),
              Container(
                  width: windowWidth * 0.44,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('CVV'),
                      FormInput(
                        controller: _cvvController,
                        fieldType: FormInputType.cvv,
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
            FormInput(
              controller: _cardHolderController,
              inputType: TextInputType.name,
              fieldType: FormInputType.clientName,
              hint: 'First and last name',
            ),
          ],
        )
      ],
    );
  }
}
