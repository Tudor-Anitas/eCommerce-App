import 'package:flutter/cupertino.dart';
import 'package:test_project/api_services/commerce_api.dart';
import 'package:test_project/api_services/images_api.dart';
import 'package:test_project/models/item_model.dart';

class ItemProvider extends ChangeNotifier {
  List<ItemModel> _itemList = [];
  List<String> _categoryList = [];
  List<String> _materialList = [];
  List<String> _colorList = [];
  int? _selectedItemId;
  String? _selectedCategory;

  List<ItemModel> get itemList => _itemList;
  int? get selectedItemId => _selectedItemId;
  String? get selectedCategory => _selectedCategory;

  Future<List<String>> updateCategoryList() async {
    _itemList.clear();
    _categoryList.clear();
    _materialList.clear();
    _colorList.clear();

    _itemList = await fetchItemList();
    var _itemImages = await fetchItemImages();
    int i = 0;

    _itemList.forEach((element) {
      element.image = _itemImages[i++];
      if (!_categoryList.contains(element.department)) {
        _categoryList.add(element.department!);
      } else if (!_materialList.contains(element.material)) {
        _materialList.add(element.material!);
      } else if (!_colorList.contains(element.color)) {
        _colorList.add(element.color!);
      }
    });

    return _categoryList;
  }

  setSelectedItemId(int? id) {
    _selectedItemId = id;
    notifyListeners();
  }

  setSelectedCategory(String? department) {
    _selectedCategory = department;
    notifyListeners();
  }

  getSelectedItem() {
    return _itemList
        .firstWhere((element) => element.department == _selectedItemId);
  }

  getCategoryItems() {
    return _itemList
        .where((element) => element.department == _selectedCategory)
        .toList();
  }
}
