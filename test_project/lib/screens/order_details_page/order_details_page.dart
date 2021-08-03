import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:test_project/components/form_validators.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/components/form_input.dart';
import 'package:test_project/screens/payment_page/payment_page.dart';

class OrderDetailsPage extends StatefulWidget {
  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _cityController = TextEditingController();
  TextEditingController _streetController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
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
              title: Text('Details'),
              elevation: 0,
              backgroundColor: Colors.transparent,
              centerTitle: true,
            ),
            body: Container(
              padding: EdgeInsets.symmetric(horizontal: windowWidth * 0.1),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Client name'),
                    FormInputField(
                      controller: _nameController,
                      validator: InputValidators().cardHolderName,
                      inputType: TextInputType.name,
                      textFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))
                      ],
                      hint: 'Your first and last name',
                    ),
                    Container(
                        margin: EdgeInsets.only(top: windowHeight * 0.02),
                        child: Text('Email')),
                    FormInputField(
                      controller: _emailController,
                      validator: InputValidators().email,
                      inputType: TextInputType.emailAddress,
                      textFormatters: [],
                      hint: 'Email',
                    ),
                    Container(
                        margin: EdgeInsets.only(top: windowHeight * 0.02),
                        child: Text('City')),
                    FormInputField(
                      controller: _cityController,
                      validator: InputValidators().city,
                      inputType: TextInputType.streetAddress,
                      textFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z ]'))
                      ],
                      hint: 'City',
                    ),
                    Container(
                        margin: EdgeInsets.only(top: windowHeight * 0.02),
                        child: Text('Street')),
                    FormInputField(
                      controller: _streetController,
                      validator: InputValidators().city,
                      inputType: TextInputType.streetAddress,
                      textFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp('[a-zA-Z ,0-9]'))
                      ],
                      hint: 'Street',
                    ),
                    Container(
                        margin: EdgeInsets.only(top: windowHeight * 0.02),
                        child: Text('Phone')),
                    FormInputField(
                      controller: _phoneNumberController,
                      validator: InputValidators().phone,
                      inputType: TextInputType.number,
                      textFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[0-9 ]')),
                        LengthLimitingTextInputFormatter(10)
                      ],
                      hint: 'Your phone number',
                    ),
                    Container(
                      width: windowWidth * 0.8,
                      height: windowHeight * 0.07,
                      margin: EdgeInsets.only(top: windowHeight * 0.05),
                      decoration: BoxDecoration(
                          color: Theme.of(context).backgroundColor,
                          borderRadius: BorderRadius.circular(30)),
                      child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              Provider.of<ItemProvider>(context, listen: false)
                                  .addCustomerDetails(
                                      _nameController.text.trim(),
                                      _emailController.text.trim(),
                                      _cityController.text.trim(),
                                      _streetController.text.trim(),
                                      _phoneNumberController.text);
                              Navigator.pushReplacement(
                                  context,
                                  PageTransition(
                                      child: PaymentPage(),
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 350)));
                            } else {
                              showToast('Incorrect data given',
                                  context: context,
                                  animDuration: Duration(microseconds: 350),
                                  animation:
                                      StyledToastAnimation.slideFromBottomFade);
                            }
                          },
                          child: Text(
                            'Continue',
                            style: Theme.of(context).textTheme.button,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
