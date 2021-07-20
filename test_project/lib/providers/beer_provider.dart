import 'package:flutter/cupertino.dart';
import 'package:test_project/components/beer.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class BeerProvider extends ChangeNotifier {
  List<BeerModel> _beerList = [];
  int? _selectedItemId;

  List<BeerModel> get beerList => _beerList;
  BeerModel getBeerFromList(int index) => beerList[index];
  int? get selectedItemId => _selectedItemId;

  Future<List<BeerModel>?> updateBeerList() async {
    try {
      var response = await http.get(Uri.parse(
          'https://random-data-api.com/api/beer/random_beer?size=10'));

      if (response.statusCode == 200) {
        _beerList = [];
        var jsonResult = json.decode(response.body);
        jsonResult.forEach((v) {
          beerList.add(BeerModel.fromJson(v));
        });

        return beerList;
      }
    } catch (e) {
      print(e);
    }
  }

  setSelectedItemId(int? id) {
    _selectedItemId = id;
    notifyListeners();
  }

  getSelectedItem() {
    return _beerList.firstWhere((element) => element.id == _selectedItemId);
  }
}
