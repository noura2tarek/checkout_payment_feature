class ItemModel {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemModel({this.name, this.quantity, this.price, this.currency});

  ItemModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['currency'] = this.currency;
    return data;
  }
}
