import 'package:flutter/cupertino.dart';
import 'package:test_project/api_services/commerce_api.dart';
import 'package:test_project/api_services/images_api.dart';
import 'package:test_project/models/item_model.dart';

class ItemProvider extends ChangeNotifier {
  List<ItemModel> _itemList = [];
  List<ItemModel> _categoryItems = [];
  List<String> _categoryList = [];
  List<String> _materialListForSelectedCategory = [];
  List<String> _colorListForSelectedCategory = [];
  String? _selectedCategory;

  List<ItemModel> get itemList => _itemList;
  List<ItemModel> get categoryItems => _categoryItems;
  List<String> get colorListForSelectedCategory =>
      _colorListForSelectedCategory;
  List<String> get materialListForSelectedCategory =>
      _materialListForSelectedCategory;
  String? get selectedCategory => _selectedCategory;

  Future<List<String>> updateCategoryList() async {
    _itemList.clear();
    _categoryList.clear();
    _colorListForSelectedCategory.clear();
    _materialListForSelectedCategory.clear();
    _itemList = await fetchItemList();
    var _itemImages = await fetchItemImages();
    int i = 0;

    _itemList.forEach((element) {
      element.image = _itemImages[i++];
      if (!_categoryList.contains(element.department)) {
        _categoryList.add(element.department!);
      }
    });

    return _categoryList;
  }

  setSelectedCategory(String? department) {
    _colorListForSelectedCategory.clear();
    _materialListForSelectedCategory.clear();
    _selectedCategory = department;
    _categoryItems = _itemList
        .where((element) => element.department == _selectedCategory)
        .toList();
    _categoryItems.forEach((element) {
      if (!_colorListForSelectedCategory.contains(element.color)) {
        _colorListForSelectedCategory.add(element.color!);
      }
      if (!_materialListForSelectedCategory.contains(element.material)) {
        _materialListForSelectedCategory.add(element.material!);
      }
    });
    notifyListeners();
  }

  applyColorFilter(String? color) {
    _categoryItems =
        _categoryItems.where((element) => element.color == color).toList();
    notifyListeners();
  }

  applyMaterialFilter(String? material) {
    _categoryItems = _categoryItems
        .where((element) => element.material == material)
        .toList();
    notifyListeners();
  }
}
