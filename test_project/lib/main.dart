import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/beer_provider.dart';
import 'package:test_project/screens/home_page.dart';
import 'package:test_project/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BeerProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: CustomTheme.customTheme,
        home: HomePage(),
      ),
    );
  }
}
