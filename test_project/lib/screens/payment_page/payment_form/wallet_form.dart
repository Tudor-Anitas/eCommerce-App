import 'package:flutter/material.dart';

import '../form_input.dart';

class WalletForm extends StatefulWidget {
  const WalletForm({ Key? key }) : super(key: key);

  @override
  _WalletFormState createState() => _WalletFormState();
}

class _WalletFormState extends State<WalletForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Client name'),
        FormInput(
          controller: _nameController,
          fieldType: FormInputType.clientName,
          inputType: TextInputType.name,
          hint: 'Your first and last name',
        ),
        Container(
          margin: EdgeInsets.only(top: windowHeight * 0.02),
          child: Text('City')
        ),
        FormInput(
          controller: _cityController,
          fieldType: FormInputType.city,
          inputType: TextInputType.streetAddress,
          hint: 'City',
        ),
        Container(
          margin: EdgeInsets.only(top: windowHeight * 0.02),
          child: Text('Street')
        ),
        FormInput(
          controller: _streetController,
          fieldType: FormInputType.street,
          hint: 'Street',
        ),
        Container(
          margin: EdgeInsets.only(top: windowHeight * 0.02),
          child: Text('Phone')
        ),
        FormInput(
          controller: _phoneNumberController,
          fieldType: FormInputType.phoneNumber,
          hint: 'Your phone number',
        ),
      ],
    );
  }
}