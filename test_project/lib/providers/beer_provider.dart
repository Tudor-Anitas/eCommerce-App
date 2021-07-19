import 'package:flutter/cupertino.dart';
import 'package:test_project/components/beer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BeerProvider extends ChangeNotifier {
  List<Beer>? beerList;

  List<Beer>? get getBeerList => beerList;

  Future<List<Beer>?> updateBeerList() async {
    try {
      var response = await http.get(
          Uri.parse('https://random-data-api.com/api/beer/random_beer?size=10'));
      var responseCode = response.statusCode;

      if (responseCode == 200) {
        beerList = [];

        var decodedBody = json.decode(response.body);
        for (int i = 0; i < 10; i++) {
          beerList!.add(Beer(
              brand: decodedBody[i]['brand'],
              name: decodedBody[i]['name'],
              alcohol: decodedBody[i]['alcohol']));
        }
        return beerList;
      }
    } catch (e) {
      print(e);
    }
  }
}
