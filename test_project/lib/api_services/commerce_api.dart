import 'package:http/http.dart';
import 'package:test_project/models/item_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<ItemModel>> fetchItemList() async {
  List<ItemModel> apiList = [];
  try {
    
    Response response = await http.get(Uri.parse(
        'https://random-data-api.com/api/commerce/random_commerce?size=30'));

    if (response.statusCode == 200) {
      var jsonResult = json.decode(response.body);
      jsonResult.forEach((v) {
        apiList.add(ItemModel.fromJson(v));
      });

      return apiList;
    }
  } catch (e) {
    print(e);
  }

  return apiList;
}
