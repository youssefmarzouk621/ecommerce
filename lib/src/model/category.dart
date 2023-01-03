class Category {
  String id;
  String name;
  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['_id'] as String;
    name = json['name'] as String;
  }
}
