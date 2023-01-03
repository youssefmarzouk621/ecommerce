// import 'dart:convert';

import 'dart:convert';

import 'package:flutter_ecommerce_app/src/model/category.dart';
import 'package:flutter_ecommerce_app/src/services/requestController.dart';

class CategoryService {
  final RequestController _requestController = RequestController();

  Future<List<Category>> findAll() async {
    final response = await _requestController.get(
        apiRoute: "api/categories/",
        headers: {});
      List<Category> categories = [];
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      for (var element in body) {
        Category category = Category.fromJson(element);
        categories.add(category);
      }
      
      return categories;
    } else {
      print("something went wrong");
      return [];
    }
  }

  }
