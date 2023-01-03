// import 'dart:convert';

import 'dart:convert';

import 'package:flutter_ecommerce_app/src/model/user.dart';
import 'package:flutter_ecommerce_app/src/services/requestController.dart';

class AuthService {
  final RequestController _requestController = RequestController();

  Future<User> login(String email, String password) async {
    final response = await _requestController.post(
        apiRoute: "api/users/login",
        body: <String, String>{'email': email, 'password': password},
        headers: {});

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      User user = User.fromJson(body);
      return user;
    } else {
      print("something went wrong");
      var body = json.decode(response.body);
      return User.withError(err: body['message']);
    }
  }

  Future<User> register(String firstName,
String lastName,
String email,
String password) async {
    final response = await _requestController
        .post(apiRoute: "api/users/register", body: <String, String>{
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'avatar': "default",
    }, headers: {});

    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      User user = User.fromJson(body);
      return user;
    } else {
      return User.withError();
    }
  }
}
