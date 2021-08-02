import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:test_project/components/form_input.dart';
import 'package:test_project/components/form_validators.dart';
import 'package:test_project/models/customer_model.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/auth_page/register_page.dart';
import 'package:test_project/screens/user_account_page/user_account_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
            title: Text('Login'),
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
          ),
          body: Container(
            height: windowHeight * 0.85,
            padding: EdgeInsets.only(
                left: windowWidth * 0.1,
                right: windowWidth * 0.1,
                top: windowHeight * 0.3),
            //color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email'),
                FormInputField(
                    controller: _emailController,
                    validator: InputValidators().email),
                Container(
                    margin: EdgeInsets.only(top: windowHeight * 0.03),
                    child: Text('Password')),
                FormInputField(
                    controller: _passwordController,
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
                      final FlutterSecureStorage secureStorage =
                          const FlutterSecureStorage();
                      var encryptionKey = base64Url
                          .decode((await secureStorage.read(key: 'key'))!);
                      var box = await Hive.openBox('accounts',
                          encryptionCipher: HiveAesCipher(encryptionKey));
                      CustomerModel currentUser =
                          box.get(_emailController.text.trim());
                      if (currentUser.password ==
                          _passwordController.text.trim()) {
                        Provider.of<ItemProvider>(context, listen: false)
                            .switchCurrentUser(currentUser);
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: UserAccountPage(),
                                type: PageTransitionType.fade));
                      } else {
                        showToast('Incorrect email or password!',
                            context: context,
                            animation: StyledToastAnimation.slideFromBottom);
                      }
                    },
                    child: Text(
                      'Login',
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
                              child: RegisterPage()));
                    },
                    child: Container(
                      width: windowWidth,
                      margin: EdgeInsets.only(top: windowHeight * 0.02),
                      child: Text(
                        "Don't have an account? Register here!",
                        textAlign: TextAlign.center,
                      ),
                    ))
              ],
            ),
          )),
    ));
  }
}
