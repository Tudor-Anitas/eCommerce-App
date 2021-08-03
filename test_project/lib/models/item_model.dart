import 'package:hive_flutter/hive_flutter.dart';

part 'item_model.g.dart';

@HiveType(typeId: 2)
class ItemModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? uid;
  @HiveField(2)
  String? color;
  @HiveField(3)
  String? department;
  @HiveField(4)
  String? material;
  @HiveField(5)
  String? productName;
  @HiveField(6)
  double? price;
  @HiveField(7)
  String? priceString;
  @HiveField(8)
  String? promoCode;
  @HiveField(9)
  String? image;
  @HiveField(10)

  ItemModel(
      {this.id,
      this.uid,
      this.color,
      this.department,
      this.material,
      this.productName,
      this.price,
      this.priceString,
      this.promoCode,
      this.image});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    color = json['color'];
    department = json['department'];
    material = json['material'];
    productName = json['product_name'];
    price = json['price'];
    priceString = json['price_string'];
    promoCode = json['promo_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['color'] = this.color;
    data['department'] = this.department;
    data['material'] = this.material;
    data['product_name'] = this.productName;
    data['price'] = this.price;
    data['price_string'] = this.priceString;
    data['promo_code'] = this.promoCode;
    return data;
  }
}
