class ProductModel {
  int id;
  String name;
  double price;
  String description;
  String tags;
  int discount;
  int quantity;
  String image;
  String categoryid;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.description,
    this.categoryid,
    this.discount,
    this.quantity,
    this.image,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    image = json['images'];
    discount = json['discount'];
    quantity = json['quantity'];
    categoryid = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'discount': discount,
      'quantity': quantity,
      'category_id': categoryid,
      'images': image,
    };
  }
}
