import 'dart:convert';

class Categories {
  final String name;
  final String id;
  Categories(this.name, this.id);

  Categories.fromJson(json)
      : name = json['name'] ?? 'NO CATEGORY',
        id = json['id'] ?? '0';
  Map<String, String> toJson() => {
        'name': name,
        'id': id,
      };
}
