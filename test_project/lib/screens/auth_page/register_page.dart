import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:test_project/components/form_input.dart';
import 'package:test_project/components/form_validators.dart';
import 'package:test_project/models/customer_model.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/auth_page/login_page.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_project/screens/user_account_page/user_account_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double windowWidth = MediaQuery.of(context).size.width;
    double windowHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Container(
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
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                title: Text('Register'),
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
              ),
              body: Container(
                height: windowHeight * 0.85,
                padding: EdgeInsets.only(
                    left: windowWidth * 0.1,
                    right: windowWidth * 0.1,
                    top: windowHeight * 0.25),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormInputField(
                          controller: _emailController,
                          hint: 'Email',
                          validator: InputValidators().city),
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: windowHeight * 0.025),
                        child: FormInputField(
                            controller: _passwordController,
                            hint: 'Password',
                            obscureText: true,
                            validator: InputValidators().city),
                      ),
                      FormInputField(
                          controller: _repeatPasswordController,
                          hint: 'Repeat password',
                          obscureText: true,
                          validator: InputValidators().city),
                      Container(
                        width: windowWidth,
                        margin: EdgeInsets.only(top: windowHeight * 0.2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Theme.of(context).backgroundColor),
                        child: TextButton(
                          onPressed: () async {
                            // verify inputs, if all good, check if the account already exists,
                            // if not put user account into hive and
                            // notify inside provider
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              final FlutterSecureStorage secureStorage =
                                  const FlutterSecureStorage();
                              var encryptionKey = base64Url.decode(
                                  (await secureStorage.read(key: 'key'))!);
                              var box = await Hive.openBox('accounts',
                                  encryptionCipher:
                                      HiveAesCipher(encryptionKey));

                              if (box.get(_emailController.text.trim()) ==
                                  null) {
                                CustomerModel newUser = CustomerModel(
                                  email: _emailController.text.trim(),
                                  password: _passwordController.text.trim(),
                                );
                                await box.put(
                                    _emailController.text.trim(), newUser);
                                Provider.of<ItemProvider>(context,
                                        listen: false)
                                    .switchCurrentUser(newUser);

                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        child: UserAccountPage(),
                                        type: PageTransitionType.fade));
                              } else {
                                showToast('Account already exists!',
                                    context: context,
                                    animation:
                                        StyledToastAnimation.slideFromBottom);
                              }
                            }
                          },
                          child: Text(
                            'Register',
                            style: Theme.of(context).textTheme.button,
                          ),
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                PageTransition(
                                    type: PageTransitionType.fade,
                                    child: LoginPage()));
                          },
                          child: Container(
                            width: windowWidth,
                            margin: EdgeInsets.only(top: windowHeight * 0.02),
                            child: Text(
                              "Already have an account? Login here!",
                              textAlign: TextAlign.center,
                            ),
                          ))
                    ],
                  ),
                ),
              ))),
    );
  }
}
