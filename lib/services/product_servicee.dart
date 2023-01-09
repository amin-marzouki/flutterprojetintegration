import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projetIntegration/models/product_model.dart';

import 'auth_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  String baseUrl = 'http://localhost:8080/api';

  Future<List<ProductModel>> getProduct() async {
    print('well');
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('tokken');
    print(token);
    var url = '$baseUrl/product/getAll';
    //  var headers = {'Content-Type': 'application/json'};

    var responsee = await http.get(url, headers: {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
    var response = json.decode(responsee.body);
    print(response);

    if (responsee.statusCode == 200) {
      List data = response;
      List<ProductModel> products = [];

      for (var item in data) {
        print(item);
        products.add(ProductModel.fromJson(item));
      }

      return products;
    } else {
      throw Exception('Gagal get product');
    }
  }
}
