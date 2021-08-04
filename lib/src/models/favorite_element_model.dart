// To parse this JSON data, do
//
//     final fisioElement = fisioElementFromJson(jsonString);

import 'dart:convert';

FavoriteElement fisioElementFromJson(String str) =>
    FavoriteElement.fromJson(json.decode(str));

String fisioElementToJson(FavoriteElement data) => json.encode(data.toJson());

class FavoriteElement {
  FavoriteElement({
    this.id,
    required this.name,
    required this.active,
  });

  int? id;
  String name;
  bool active;

  FavoriteElement.create(this.name, this.active);

  factory FavoriteElement.fromJson(Map<String, dynamic> json) => FavoriteElement(
        id: json["id"],
        name: json["name"],
        active: json["active"] == 1,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
      };
}
