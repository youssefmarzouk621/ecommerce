import 'package:flutter_ecommerce_app/src/model/category.dart';

class Product {
  String id;
  String name;
  String description;
  String price;
  Category category;
  List<String> images;

  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.category,
      this.images});


    Product.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String;
    name = json['name'] as String;
    description = json['description'] as String;
    price = json['price'] as String;
    category = Category.fromJson(json['category']);
    var tmp = json['images'];
    List<String> list = [];
    for (String img in tmp) {
      list.add(img);
    }
    images = list;
  }
}
