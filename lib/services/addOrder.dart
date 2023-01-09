import 'dart:convert';

import 'package:projetIntegration/models/cart_model.dart';
import 'package:projetIntegration/models/product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

/*class AddedOrder {
  
  Future add(List<CartModel> p) async {
    String baseUrl = 'http://localhost:8080/api';
    List<int> productId;
    var url = '$baseUrl/order/create';
    for (var i in p) {
      productId.add(i.product.id);
    }
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('tokken');
    var id = int.parse(localStorage.getString('id'));
    var body = jsonEncode({
      'user': id,
      'products': productId,
    });
    var responsee = await http.post(url,
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: body);
    print('huhuhuhuhuhuhuoooooooooooooooooooooooooyyyyyyyyyyyyyyyyyyyyyyy');
  }
}
*/