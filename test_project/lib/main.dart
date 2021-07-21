import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/home_page/home_page.dart';
import 'package:test_project/theme.dart';

void main() {
  runApp(ChangeNotifierProvider<CustomTheme>(
      create: (context) => CustomTheme(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<CustomTheme>(context).currentTheme,
        home: HomePage(),
      ),
    );
  }
}
