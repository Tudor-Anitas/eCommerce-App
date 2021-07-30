import 'package:flutter/cupertino.dart';
import 'package:test_project/api_services/commerce_api.dart';
import 'package:test_project/api_services/images_api.dart';
import 'package:test_project/models/credit_card_model.dart';
import 'package:test_project/models/customer_model.dart';
import 'package:test_project/models/item_model.dart';

enum PaymentMethod { credit, wallet }

class ItemProvider extends ChangeNotifier {
  Map<ItemModel, int> _itemMap = Map();
  Map<ItemModel, int> _shoppingCart = Map();
  List<ItemModel> _categoryItems = [];
  List<String> _categoryList = [];
  List<String> _materialListForSelectedCategory = [];
  List<String> _colorListForSelectedCategory = [];
  PaymentMethod _paymentMethod = PaymentMethod.credit;
  String? _selectedCategory;
  ItemModel? _selectedItem;
  CustomerModel? _customer;
  double? _totalCartPrice;

  Map<ItemModel, int> get itemList => _itemMap;
  Map<ItemModel, int> get shoppingCart => _shoppingCart;
  List<ItemModel> get categoryItems => _categoryItems;
  List<String> get colorListForSelectedCategory =>
      _colorListForSelectedCategory;
  List<String> get materialListForSelectedCategory =>
      _materialListForSelectedCategory;
  PaymentMethod get paymentMethod => _paymentMethod;
  String? get selectedCategory => _selectedCategory;
  ItemModel? get selectedItem => _selectedItem;
  CustomerModel? get customer => _customer;
  double? get totalCartPrice => _totalCartPrice;

  Future<List<String>> fetchCategoryList() async {
    _itemMap.clear();
    _categoryList.clear();
    _categoryItems.clear();
    _shoppingCart.clear();
    _totalCartPrice = 0;
    _colorListForSelectedCategory.clear();
    _materialListForSelectedCategory.clear();
    _itemMap = await fetchItemList();
    var _itemImages = await fetchItemImages();
    int i = 0;

    _itemMap.forEach((element, value) {
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
    _categoryItems = _itemMap.keys
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

  setSelectedItem(int? itemId) {
    _selectedItem = _itemMap.keys.firstWhere((element) => element.id == itemId);
  }

  setPaymentMethod(PaymentMethod method) {
    _paymentMethod = method;
    notifyListeners();
  }

  addToShoppingCart(int? itemId) {
    setSelectedItem(itemId);
    if (!_shoppingCart.keys.contains(_selectedItem) &&
        _itemMap[_selectedItem]! > 0) {
      _itemMap[_selectedItem!] = _itemMap[_selectedItem!]! - 1;
      _shoppingCart[_selectedItem!] = 1;
      _totalCartPrice = _totalCartPrice! + _selectedItem!.price!;
      notifyListeners();
    }
  }

  removeFromShoppingCart(int? itemId) {
    setSelectedItem(itemId);
    _totalCartPrice = _totalCartPrice! -
        _selectedItem!.price! * _shoppingCart[_selectedItem!]!;

    _shoppingCart.removeWhere((key, value) => key.id == itemId);

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

  addQuantityInCart(int? itemId) {
    setSelectedItem(itemId);
    if (_itemMap[_selectedItem]! > 0) {
      _itemMap[_selectedItem!] = _itemMap[_selectedItem!]! - 1;
      _shoppingCart[_selectedItem!] = _shoppingCart[_selectedItem!]! + 1;
      _totalCartPrice = _totalCartPrice! + _selectedItem!.price!;
      notifyListeners();
    }
  }

  substractQuantityInCart(int? itemId) {
    setSelectedItem(itemId);
    _itemMap[_selectedItem!] = _itemMap[_selectedItem!]! + 1;
    _shoppingCart[_selectedItem!] = _shoppingCart[_selectedItem!]! - 1;
    _totalCartPrice = _totalCartPrice! - _selectedItem!.price!;
    notifyListeners();
  }

  addCustomerDetails(String name, String email, String city, String street,
      String phoneNumber) {
    _customer = CustomerModel(
        name: name,
        email: email,
        city: city,
        street: street,
        phoneNumber: phoneNumber);
    notifyListeners();
  }

  addCreditCard(String cardNumber, String expirationDate, String cvv,
      String cardHolderName) {
    _customer!.creditCardModel = CreditCardModel(
        cardHolderName: cardHolderName,
        cardNumber: cardNumber,
        cvv: cvv,
        expirationDate: expirationDate);
  }
}
