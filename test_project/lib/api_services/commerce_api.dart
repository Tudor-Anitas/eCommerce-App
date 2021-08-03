import 'package:http/http.dart';
import 'package:test_project/models/item_model.dart';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

Future<Map<ItemModel, int>> fetchItemList() async {
  // the int defines the stock of the item
  Map<ItemModel, int> apiList = Map();
  try {
    Response response = await http.get(Uri.parse(
        'https://random-data-api.com/api/commerce/random_commerce?size=30'));

    if (response.statusCode == 200) {
      var jsonResult = json.decode(response.body);
      jsonResult.forEach((v) {
        apiList[ItemModel.fromJson(v)] = Random().nextInt(15) + 1;
      });

      return apiList;
    }
  } catch (e) {
    print(e);
  }

  return apiList;
}
