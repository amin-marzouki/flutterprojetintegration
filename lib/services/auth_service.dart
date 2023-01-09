import 'dart:convert';

import 'package:projetIntegration/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String baseUrl = 'http://localhost:8080/api';

  String value;
  Future<UserModel> register(
      {String name,
      String email,
      String password,
      String adress,
      int mobile,
      int age}) async {
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'adress': adress,
      'email': email,
      'password': password,
      'mobile': mobile,
      'age': age
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    String email,
    String password,
  }) async {
    var url = '$baseUrl/login/user';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['user_profile_details'];
      var dat1 = jsonDecode(response.body)['token'];
      UserModel user = UserModel.fromJson(data);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('tokken', dat1);
      await prefs.setString('id', user.id.toString());

      user.token = 'Bearer ' + dat1;

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
