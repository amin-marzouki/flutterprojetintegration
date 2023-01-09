import 'package:projetIntegration/models/product_model.dart';
import 'category_model.dart';

class ShopModel {
  int id;
  String email, description, name, phoneNumber, adress;
  List<ProductModel> products;
  CategoryModel category;
  ShopModel(
      {this.id,
      this.name,
      this.email,
      this.description,
      this.phoneNumber,
      this.adress,
      this.category});

  ShopModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    adress = json['adress'];
    phoneNumber = json['phoneNumber'];
    description = json['description'];

    products = json['products']
        .map<ProductModel>((product) => ProductModel.fromJson(product))
        .toList();
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'description': description,
      'adress': adress,
      'products': products.map((product) => product.toJson()).toList(),
      'phoneNumber': phoneNumber
    };
  }
}
