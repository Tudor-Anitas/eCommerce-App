class ItemModel {
  int? id;
  String? uid;
  String? color;
  String? department;
  String? material;
  String? productName;
  double? price;
  String? priceString;
  String? promoCode;
  String? image;

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
