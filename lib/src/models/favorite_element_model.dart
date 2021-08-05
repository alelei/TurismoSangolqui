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
    required this.place_name,
    required this.coment,
  });

  int? id;
  String place_name;
  String coment;

  FavoriteElement.create(this.place_name, this.coment);

  factory FavoriteElement.fromJson(Map<String, dynamic> json) => FavoriteElement(
        id: json["id"],
        place_name: json["place_name"],
        coment: json["coment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "place_name": place_name,
        "coment": coment,
      };
}
