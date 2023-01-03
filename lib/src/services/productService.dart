// import 'dart:convert';

import 'dart:convert';

import 'package:flutter_ecommerce_app/src/model/product.dart';
import 'package:flutter_ecommerce_app/src/services/requestController.dart';

class ProductService {
  final RequestController _requestController = RequestController();

  Future<List<Product>> findAll() async {
    final response = await _requestController.get(
        apiRoute: "api/products/",
        headers: {});
      List<Product> products = [];
    if (response.statusCode == 200) {
      var body = json.decode(response.body);
      for (var element in body) {
        Product product = Product.fromJson(element);
        products.add(product);
      }
      
      return products;
    } else {
      print("something went wrong");
      return [];
    }
  }

  }
