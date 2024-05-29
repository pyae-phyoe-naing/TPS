class Menu {
  int? id;
  int? categoryId;
  String? name;

  Menu({this.id, this.categoryId, this.name});

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json['id'],
        categoryId: json['categoryId'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['id'] = id;
    data['categoryId'] = categoryId;
    data['name'] = name;
    return data;
  }
}
