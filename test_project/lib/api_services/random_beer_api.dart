import 'package:http/http.dart';
import 'package:test_project/models/beer_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<BeerModel>> fetchBeerList() async {
  List<BeerModel> apiList = [];
  try {
    Response response = await http.get(
        Uri.parse('https://random-data-api.com/api/beer/random_beer?size=10'));

    if (response.statusCode == 200) {
      var jsonResult = json.decode(response.body);
      jsonResult.forEach((v) {
        apiList.add(BeerModel.fromJson(v));
        
      });

      return apiList;
    }
  } catch (e) {
    print(e);
  }

  return apiList;
}
