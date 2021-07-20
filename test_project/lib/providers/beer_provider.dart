import 'package:flutter/cupertino.dart';
import 'package:test_project/components/beer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BeerProvider extends ChangeNotifier {
  List<Beer>? beerList;

  Beer getBeerFromList(int index) => beerList![index];

  Future<List<Beer>?> updateBeerList() async {
    try {
      var response = await http.get(Uri.parse(
          'https://random-data-api.com/api/beer/random_beer?size=10'));
      var responseCode = response.statusCode;

      if (responseCode == 200) {
        beerList = [];

        var decodedBody = json.decode(response.body);
        for (int i = 0; i < 10; i++) {
          beerList!.add(Beer(
              id: decodedBody[i]['id'],
              brand: decodedBody[i]['brand'],
              name: decodedBody[i]['name'],
              alcohol: decodedBody[i]['alcohol'],
              ibu: decodedBody[i]['ibu'],
              malts: decodedBody[i]['malts'],
              style: decodedBody[i]['style'],
              yeast: decodedBody[i]['yeast']));
        }
        return beerList;
      }
    } catch (e) {
      print(e);
    }
  }
}
