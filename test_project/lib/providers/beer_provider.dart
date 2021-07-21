import 'package:flutter/cupertino.dart';
import 'package:test_project/api_services/random_beer_api.dart';
import 'package:test_project/models/beer_model.dart';

class BeerProvider extends ChangeNotifier {
  List<BeerModel> _beerList = [];
  int? _selectedItemId;

  List<BeerModel> get beerList => _beerList;
  int? get selectedItemId => _selectedItemId;

  Future<List<BeerModel>> updateBeerList() async {
    _beerList = await fetchBeerList();
    return _beerList;
  }

  setSelectedItemId(int? id) {
    _selectedItemId = id;
    notifyListeners();
  }

  getSelectedItem() {
    return _beerList.firstWhere((element) => element.id == _selectedItemId);
  }
}
