import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:test_project/models/credit_card_model.dart';
import 'package:test_project/models/item_model.dart';
import 'package:test_project/providers/item_provider.dart';
import 'package:test_project/screens/home_page/home_page.dart';
import 'package:test_project/theme.dart';

import 'models/customer_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CustomerModelAdapter());
  Hive.registerAdapter(CreditCardModelAdapter());
  Hive.registerAdapter(ItemModelAdapter());
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  var containsEncryptionKey = await secureStorage.containsKey(key: 'key');
  if (!containsEncryptionKey) {
    var key = Hive.generateSecureKey();
    await secureStorage.write(key: 'key', value: base64UrlEncode(key));
  }

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
