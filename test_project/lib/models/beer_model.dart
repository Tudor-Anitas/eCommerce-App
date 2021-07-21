class BeerModel {
  int? id;
  String? uid;
  String? brand;
  String? name;
  String? style;
  String? hop;
  String? yeast;
  String? malts;
  String? ibu;
  String? alcohol;
  String? blg;

  BeerModel(
      {this.id,
      this.uid,
      this.brand,
      this.name,
      this.style,
      this.hop,
      this.yeast,
      this.malts,
      this.ibu,
      this.alcohol,
      this.blg});

  BeerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uid = json['uid'];
    brand = json['brand'];
    name = json['name'];
    style = json['style'];
    hop = json['hop'];
    yeast = json['yeast'];
    malts = json['malts'];
    ibu = json['ibu'];
    alcohol = json['alcohol'];
    blg = json['blg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uid'] = this.uid;
    data['brand'] = this.brand;
    data['name'] = this.name;
    data['style'] = this.style;
    data['hop'] = this.hop;
    data['yeast'] = this.yeast;
    data['malts'] = this.malts;
    data['ibu'] = this.ibu;
    data['alcohol'] = this.alcohol;
    data['blg'] = this.blg;
    return data;
  }
}
